---
title: How to split your Symfony config into separate files
author: Toby Griffiths
categories:
- coding
tags:
- php
- symfony
- how-to
abstract: >
  Ever wondered how you could split your rather complicated symfony config file into multiple files?  Here I share the 
  method I used when I wanted to split the config files for individual clients into separate files  

---


AppKernel::registerContainerConfiguration(changes)…

````
    /**
     * Loads the container configuration.
     *
     * @param LoaderInterface $loader A LoaderInterface instance
     *
     * @api
     */
    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load($this->getRootDir() . '/config/config_' . $this->getEnvironment() . '.yml');

        $clientConfigPattern = $this->getRootDir() . '/config/clients/*.yml';

        $clientConfigFiles = glob($clientConfigPattern);

        foreach ($clientConfigFiles as $clientConfigFile) {
            $loader->load($clientConfigFile);
        }
    }
````