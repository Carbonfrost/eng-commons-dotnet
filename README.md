##  Engineering Platform

### What and why

This repository provides a set of Make files for building and testing software.  The Engineering Platform provides a consistent experience when developing Carbonfrost software.

### Installing

Once you have created a new repository, you can install the engineering platform, which occupies the `eng` folder within the project repository. 

The following command gets the latest version and installs it.

```bash
curl -sL https://raw.githubusercontent.com/Carbonfrost/eng-commons-dotnet/master/eng/.mk/eng.mk | make -f -
```

### Getting Started

#### .NET Core

To use .NET Core in the project, run the command:

```bash
make use/dotnet
```

### Prerequisites

Dependent software, including the runtime and SDKs are installed via [Homebrew](https://brew.sh).
