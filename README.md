# Example ecs-modules for Terragrunt

This repo, along with the [terragrunt-ecs-nginx repo](https://github.com/itmustbejj/terragrunt-ecs-modules),
show an example file/folder structure you can use with [Terragrunt](https://github.com/gruntwork-io/terragrunt)
to keep your [Terraform](https://www.terraform.io) code DRY. For background information, check out the
[Keep your Terraform code DRY](https://github.com/gruntwork-io/terragrunt#keep-your-terraform-code-dry) section
of the Terragrunt documentation.

This repo contains the following example code:

* [vpc](/vpc): An example AWS VPC with [terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc)

* [ecs](/ecs): An example AWS Elastic Container Service (ECS)  Cluster with [terraform-aws-ecs](https://github.com/itmustbejj/terraform-aws-ecs/tree/master/modules).

* [alb](/alb): An example AWS Application Load Balancer (ALB) with [terraform-aws-ecs](https://github.com/itmustbejj/terraform-aws-ecs/tree/master/modules).

* [svc](/svc): An example AWS ECS Service with [terraform-aws-ecs](https://github.com/itmustbejj/terraform-aws-ecs/tree/master/modules).

Note: This code is solely for demonstration purposes. This is not production-ready code, so use at your own risk. If
you are interested in battle-tested, production-ready Terraform code, check out [Gruntwork](http://www.gruntwork.io/).

## How do you use these modules?

To use a module, create a  `terragrunt.hcl` file that specifies the module you want to use as well as values for the
input variables of that module:

```hcl
# Use Terragrunt to download the module code
terraform {
  source = "git::git@github.com:itmustbejj/terragrunt-ecs-modules.git//path/to/module?ref=master"
}

# Fill in the variables for that module
inputs = {
  foo = "bar"
  baz = 3
}
```

(*Note: the double slash (`//`) in the `source` URL is intentional and required. It's part of Terraform's Git syntax 
for [module sources](https://www.terraform.io/docs/modules/sources.html).*)

You then run [Terragrunt](https://github.com/gruntwork-io/terragrunt), and it will download the source code specified 
in the `source` URL into a temporary folder, copy your `terragrunt.hcl` file into that folder, and run your Terraform 
command in that folder: 

```
> terragrunt apply
[terragrunt] Reading Terragrunt config file at terragrunt.hcl
[terragrunt] Downloading Terraform configurations from git::git@github.com:itmustbejj/terragrunt-ecs-modules.git//path/to/module?ref=master
[terragrunt] Copying files from . into .terragrunt-cache
[terragrunt] Running command: terraform apply
[...]
```

Check out the [terragrunt-ecs-nginx repo](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example) for examples and the [Keep your Terraform
code DRY documentation](https://github.com/gruntwork-io/terragrunt#keep-your-terraform-code-dry) for more info





## How do you change a module?


### Local changes

Here is how to test out changes to a module locally:

1. `git clone` this repo.
1. Update the code as necessary.
1. Go into the folder where you have the `terragrunt.hcl` file that uses a module from this repo (preferably for a 
   dev or staging environment!).
1. Run `terragrunt plan --terragrunt-source <LOCAL_PATH>`, where `LOCAL_PATH` is the path to your local checkout of
   the module code. 
1. If the plan looks good, run `terragrunt apply --terragrunt-source <LOCAL_PATH>`.   

Using the `--terragrunt-source` parameter (or `TERRAGRUNT_SOURCE` environment variable) allows you to do rapid, 
iterative, make-a-change-and-rerun development.


### Releasing a new version

When you're done testing the changes locally, here is how you release a new version:

1. Update the code as necessary.
1. Commit your changes to Git: `git commit -m "commit message"`.
1. Add a new Git tag using one of the following options:
    1. Using GitHub: Go to the [releases page](/releases) and click "Draft a new release".
    1. Using Git:

    ```
    git tag -a v0.0.2 -m "tag message"
    git push --follow-tags
    ```
1. Now you can use the new Git tag (e.g. `v0.0.2`) in the `ref` attribute of the `source` URL in `terragrunt.hcl`.
1. Run `terragrunt plan`.
1. If the plan looks good, run `terragrunt apply`.   
