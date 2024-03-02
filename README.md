# cuepkgs

This repository is a personal collection of CUE modules hosted in an OCI (Open Container Initiative) registry.

## Overview

CUE is a powerful language for defining, generating, and validating all kinds of data.
In this repository, I maintain a selection of CUE packages that you can use as part of your data processing and validation workflows.

## Prerequisites

Ensure you have CUE installed to use these modules.
For details about how to use modules, refer to the [CUE Module References Documentation](https://alpha.cuelang.org/docs/reference/modules/#intro).

## Usage

Import a package from one of the modules found in `github.com/kharf/cuepkgs/modules`.

```cue
import "github.com/kharf/cuepkgs/modules/xxx/..."
```

Run `cue mod tidy`.

Example:

```cue
import "github.com/kharf/cuepkgs/modules/k8s/k8s.io/api/core/v1"

_namespace: v1.#Namespace & {
	apiVersion: "v1"
	kind:       "Namespace"
	metadata: name: "podinfo"
}
```
