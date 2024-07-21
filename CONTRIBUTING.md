# Contributing to `equatable_macro`

Thank you for considering contributing to the `equatable_macro` package! Your contributions help make the package better for everyone. Here’s how you can get involved.

## How to Contribute

We welcome contributions in various forms, including bug reports, feature requests, code contributions, and documentation improvements.

### Reporting Issues

If you find a bug or have a feature request, please create an issue on our [GitHub repository](https://github.com/antinna/equatable_macro/issues). Be sure to provide as much detail as possible, including steps to reproduce the issue and any relevant screenshots or code snippets.

### Submitting Code

1. **Fork the repository**: Click the "Fork" button on the [GitHub repository page](https://github.com/antinna/equatable_macro) to create a copy of the repository under your own GitHub account.

2. **Clone your fork**: Clone your forked repository to your local machine using:

    ```
    git clone https://github.com/your-username/equatable_macro.git
    ```

3. **Create a branch**: Create a new branch for your changes. For stable releases, use the `stable` branch, and for pre-release versions, use the `main` branch:

    - For stable contributions:
      ```
      git checkout -b stable
      ```
    - For pre-release contributions:
      ```
      git checkout -b main
      ```

4. **Make your changes**: Make the necessary changes or additions to the code. Be sure to follow the existing code style and conventions.

5. **Write tests**: If you’re adding new features or fixing bugs, make sure to add or update tests to cover your changes.

6. **Commit your changes**: Commit your changes with a clear and descriptive commit message:

    ```
    git add .
    git commit -m "Describe your changes here"
    ```

7. **Push your changes**: Push your changes to your forked repository:

    ```
    git push origin your-branch-name
    ```

8. **Create a pull request**: Go to the [GitHub repository page](https://github.com/antinna/equatable_macro) and create a pull request from your branch to the appropriate branch of the original repository:

    - **Stable contributions**: Create a pull request to the `stable` branch.
    - **Pre-release contributions**: Create a pull request to the `main` branch.

    Provide a clear description of the changes and reference any related issues.

## Versions

The `equatable_macro` package has two versions:

- **Pre-release Version**: This version may include experimental features and is indicated by a `-main` suffix (e.g., `0.0.1-main.1`).
- **Stable Version**: This version is considered stable and is indicated without a suffix (e.g., `0.0.1`).

Ensure that your contributions are aligned with the correct versioning scheme and specify whether your changes affect the pre-release or stable version.

## Development Setup

To set up the development environment for `equatable_macro`, follow these steps:

1. **Ensure you have the Dart SDK** installed. You can download it from [dart.dev](https://dart.dev/get-dart).

2. **Install dependencies**: Run the following command to get all the necessary dependencies:

    ```
    dart pub get
    ```

3. **Run tests with macros enabled**: To ensure everything is working as expected with macros, run the tests with the following command:

    ```
    dart --enable-experiment=macros test
    ```

## Additional Resources

- [Dart Documentation](https://dart.dev/guides)
- [GitHub Documentation](https://docs.github.com/en)

Thank you for contributing to `equatable_macro`!
