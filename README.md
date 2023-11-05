
Hey Cloud & DevOps Enthusiasts,

I am back with another blog in the series of DevOps. In this blog, we will learn how to create modules in Terraform. 

Before we start, let's understand what is a module in Terraform.

## What is Terraform?

Terraform is an open-source infrastructure as code software tool created by HashiCorp. It enables users to define and provision a datacenter infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON.

Terraform supports a number of cloud infrastructure providers such as Amazon Web Services, IBM Cloud (formerly Bluemix), Google Cloud Platform, Linode, Microsoft Azure, Oracle Cloud Infrastructure, or VMware vSphere as well as OpenStack.

## What is a module in Terraform?

A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

## Why do we need modules in Terraform?

Modules are the key to reusability in Terraform. They are a way to package Terraform configurations for re-use, to avoid repetition, and to organize configuration. Modules are containers for multiple resources that are used together. 


Theory is enough, let's get our hands dirty.

## Prerequisites:

- AWS Account
- Terraform installed
- AWS CLI installed
- AWS Access Key and Secret Key

In this blog, I have created 3 modules:
    - VPC
    - EC2
    - Security Group

In the VPC module, I have created a VPC, Internet Gateway, Route Table, and Public Subnet. 


In the EC2 module, I have created an EC2 instance. 

In the Security Group module, I have created a Security Group.

The structure of the modules is as follows:

```bash
modules
└── vpc
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
└── security_group
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
└── ec2
    ├── main.tf
    ├── outputs.tf
    └── variables.tf

```
### VPC Module
In the main.tf file of the VPC module, I have written the code to create a VPC, Internet Gateway, Route Table, and Public Subnet.

In outputs.tf file of the VPC module, I have written the code to output the VPC ID, and Public Subnet ID.

This output will be used in the EC2 module.

In the variables.tf file of the VPC module, I have written the code to declare the variables of the VPC module such as VPC CIDR, and Public Subnet CIDR. 


### Security Group Module
In the main.tf file of the Security Group module, I have written the code to create a Security Group.

In this Security Group, I am using dynamic blocks to create Security Group Ingress and Egress rules which means I can create multiple Security Group Ingress and Egress rules using a single block of code.

In outputs.tf file of the Security Group module, I have written the code to output the Security Group ID.

This output will be used in the EC2 module to attach the Security Group to the EC2 instance.

In the variables.tf file of the Security Group module, I have written the code to declare the variables of the Security Group module such as Security Group Ingress and Egress rules.


### EC2 Module

In the main.tf file of the EC2 module, I have written the code to create an EC2 instance.

In outputs.tf file of the EC2 module, I have written the code to output the EC2 public IP.

This output will be used to access the application that will be deployed on the EC2 instance.

In the variables.tf file of the EC2 module, I have written the code to declare the variables of the EC2 module such as AMI ID, Instance Type, Public subnet ID, VPC ID, and Security Group ID.


### How we will use these modules?

Now we have created the modules, let's see how we will use these modules.

Let's see the structure

```bash
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf
└── userdata.sh
```

In the main.tf file, I have written the code to call the modules.

In the provider.tf file, I have written the code to configure the AWS provider.

In the terraform.tfvars file, I have written the code to declare the variables of the main.tf file such as vpc_cidr, public_subnet_cidr, ami_id, instance_type, public_subnet_id, vpc_id, and security_group_id.

In the terraform.tfvars file, I have configured to dynamically assign the ingress and egress rules to the Security Group. Here I am allowing port 22 and 80 from anywhere using the ingress and allowing all traffic to anywhere using the egress.

In the userdata.sh file, I have written the code to install the nginx webserver on the EC2 instance. Since we made EC2 Security Group ingress rule to allow port 80, we can access the application on port 80.

In the userdata.sh file, I have also written the code to start the nginx service. 

> Note: userdata.sh file is mandatory. You can use it if you want to install any application on the EC2 instance.
In the real-world scenario, userdata.sh file is not used. We use configuration management tools such as Ansible, Chef, Puppet, etc. to install and configure the application on the EC2 instance.

For the sake of simplicity, I am using userdata.sh file and made it mandatory. 


### How to run the code?

To run the code, follow the below steps:

- Clone the repository
- Go to the directory
- Run the command `terraform init`
- Run the command `terraform apply -auto-approve`
- Once the code is executed, you will get the EC2 public IP in the output section. Copy the IP and paste it in the browser. You will see the nginx webserver running on the EC2 instance.

### Conclusion

In this blog, we have learned how to create modules in Terraform. Then we have learned how to use these modules and run a complete infrastructure using these modules.
