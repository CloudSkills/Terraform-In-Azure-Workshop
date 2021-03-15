# Run
# python test_rg.py '../../../Day-2/ResourceGroup/'

import os
import time
import sys


def terraform_init(path):
  os.system(f'cd {path} && terraform init')

def terraform_plan(path):
  os.system(f'cd {path} && terraform plan')

def terraform_apply(path):
  os.system(f'cd {path} && terraform apply -auto-approve')

def terraform_destroy(path):
  os.system(f'cd {path} && terraform destroy -auto-approve')


path = sys.argv[1]


if __name__ == '__main__':
  terraform_init(path)
  terraform_plan(path)
  terraform_apply(path)
  terraform_destroy(path)