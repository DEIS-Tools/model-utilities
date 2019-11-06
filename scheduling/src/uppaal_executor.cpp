// POSIX includes
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

// Other includes
#include <iostream>
#include <sstream>
#include <uppaal_executor.hpp>

constexpr int PARENT_READ = 0;
constexpr int CHILD_WRITE = 1;
constexpr int CHILD_READ = 2;
constexpr int PARENT_WRITE = 3;

constexpr int NO_FLAGS = 0;

std::string scheduling::UppaalExecutor::execute()
{
    pid_t pid;
    int fd[4];

    pipe(fd);
    pipe(fd + 2);

    pid = fork();

    if (pid == 0) {
        // Child
        dup2(fd[CHILD_WRITE], STDOUT_FILENO);
        dup2(fd[CHILD_READ], STDIN_FILENO);
        close(fd[PARENT_WRITE]);
        close(fd[PARENT_READ]);

        const char *command = "verifyta";

        int ret = execlp(command, command, modelPath, queriesPath, nullptr);

        if (ret == -1) {
            throw SchedulingException("Could not start verifyta. errno: " + std::to_string(errno) +
                                      ".");
        }

        return "";
    }
    else {
        // Parent
        close(fd[CHILD_WRITE]);
        close(fd[CHILD_READ]);

        // Wait for completion
        std::cout << "Waiting for completion...\n";
        int status;
        waitpid(pid, &status, NO_FLAGS);
        std::cout << "Scheduling complete with status " << status << ".\n";

        // Only do something if we actually did get a result
        if (status != 0) {
            // Cleanup after use
            close(fd[PARENT_WRITE]);
            close(fd[PARENT_READ]);

            throw SchedulingException{"Could not start verifyta."};
        }

        // Read all from pipe
        std::stringstream ss;
        char buffer[2048];
        ssize_t bytes = 0;

        while ((bytes = read(fd[PARENT_READ], buffer, 2048)) > 0) {
            ss.write(buffer, bytes);
        }

        // Cleanup after use
        close(fd[PARENT_WRITE]);
        close(fd[PARENT_READ]);

        return ss.str();
    }
}