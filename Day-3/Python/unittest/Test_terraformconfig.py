# Run
# python -m unittest

import unittest
import os
import sys

class TestTerraformConfig(unittest.TestCase):

    def test_terraform_plan(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform plan')

    def test_terraform_apply(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform apply -auto-approve')

    def test_terraform_destroy(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform destroy -auto-approve')


path = sys.argv[1]


if __name__ == '__main__':
    unittest.main()
