# DevOps BP November

To run the examples you will need

* Terraform 0.7+
* Packer 0.12.0+
* Ansible 2.2+
* AWS account: AWS_SECRET_ACCESS_KEY and AWS_ACCESS_KEY_ID environment variables set up
* Docker

Look into the Makefiles to see how to run it

Example:

    # Creating and running the nginx image
    $ cd nginx/
    $ make packer
    # At this point you already have a docker image that can be run
    # To launch an EC2 instance:
    $ make aws

Slides are available as part of the repository or at http://slides.com/tmichelberger/make-baking-easy-with-packer.
