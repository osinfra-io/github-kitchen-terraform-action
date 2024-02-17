# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/202321831-9cf218f9-660d-481f-8578-c2ba19fcc93a.png"> Kitchen-Terraform Github Action

**[GitHub Actions](https://github.com/osinfra-io/github-kitchen-terraform-action/actions):**

[![Dependabot](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/dependabot.yml) [![CodeQL](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/github-code-scanning/codeql) [![Docker Build and Push](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/osinfra-io/github-kitchen-terraform-action/actions/workflows/build-and-push.yml)

[Kitchen-Terraform](https://github.com/newcontext-oss/kitchen-terraform) provides a set of Kitchen plugins that enable the use of Kitchen to converge a Terraform configuration and verify the resulting infrastructure systems with InSpec controls.

## Inputs

### `kitchen-command`

**Required** The name of the command to run. Default `"help"`.

More Examples:

```none
  converge [INSTANCE|REGEXP|all]    # Change instance state to converge. Use a provisioner to configure...
  create [INSTANCE|REGEXP|all]      # Change instance state to create. Start one or more instances
  destroy [INSTANCE|REGEXP|all]     # Change instance state to destroy. Delete all information for one ...
  help [COMMAND]                    # Describe available commands or one specific command
  test [INSTANCE|REGEXP|all]        # Test (destroy, create, converge, setup, verify and destroy) one o...
  verify [INSTANCE|REGEXP|all]      # Change instance state to verify. Run automated tests on one or mo...
  version                           # Print Kitchen's version information
```

### `kitchen-instance`

**Optional** The name of the instance to run the command on. You can run `kitchen list` to see the available instances.

This is useful when you have multiple instances in your `.kitchen.yml` file and you want to run the command on a specific instance for
example if you need to destroy a specific instance when dealing with more complex test scenarios.

## Example usage

```yaml
- name: Kitchen Converge
  uses: osinfra-io/github-kitchen-terraform-action@v2.5.0
  with:
    kitchen-command: "converge"
```

```yaml
- name: Kitchen Destroy
  uses: osinfra-io/github-kitchen-terraform-action@v2.5.0
  with:
    kitchen-command: "destroy"
    kitchen-instance: "default-test-gcp"
```

An example called workflow can be found [here](https://github.com/osinfra-io/github-terraform-gcp-called-workflows/blob/main/.github/workflows/kitchen-terraform.yml).
