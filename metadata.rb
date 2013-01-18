maintainer       'Reaktor Innovations Oy'
maintainer_email 'cookbooks@reaktor.fi'
license          'Apache v2.0'
name             'debian'
description      'Sets up Debian repositories'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports         'debian'
depends          'apt'
