# Ducki Bank

This is a [go](https://go.dev/) backend project for a simple bank system.

## Getting Started

First, you need to install the [sqlc](https://docs.sqlc.dev/en/stable/overview/install.html) library to generate SQL statements if you want to edit the database/queries.

For macos:

```bash
brew install sqlc
```

Second, you need to edit your .env file to configure the database, see .env.example for the keys used.

Third, use the Makefile to setup and run the project.
