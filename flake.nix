{
  description = "A tasty theme modification for Firefox 🦊";

  outputs =
    { self }:
    {
      homeModules = {
        default = self.homeModules.parfait;
        parfait = ./homeModule.nix;
      };
    };
}
