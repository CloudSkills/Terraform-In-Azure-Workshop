## GO111MODULE

Ensure that the `GO111MODULE` environment variable is set on your localhost. This allows you to pull packages based on specific package versions.

## Install the following

go get github.com/gruntwork-io/terratest/modules/terraform
go get "github.com/stretchr/testify/assert"

## Init a Mod
For the test to run, Go needs a module initialized. `cd` into the directory with the test and run `go mod init test`

## Running a test

Change directory (`cd`) into the directory with the test and run `go test -v`. The `-v` flag stands for verbose.
