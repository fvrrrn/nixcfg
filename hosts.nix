{
  pkgs,
  config,
  ...
}: {
  networking.extraHosts = ''
    127.0.0.1 localapp.dev.cyberprod.ru
    127.0.0.1 localapp2.dev.probalance-zaem.ru
    192.168.3.202 jira.skybank.local
    192.168.3.217 gitlab.skybank.local
    192.168.3.202 confluence.skybank.local
  '';
}
