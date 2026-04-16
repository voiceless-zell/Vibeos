{
  # TODO: replace with the actual SSH install target, e.g. root@192.168.1.50 or nixos@gallifrey.lan.
  targetHost ? "root@TODO-gallifrey-target",
  # TODO: if the installer should connect via a non-default SSH port, update the generated command.
  sshPort ? 22,
}:
let
  target = if sshPort == 22 then targetHost else "${targetHost} -p ${toString sshPort}";
in
{
  installCommand = ''
    nix run github:nix-community/nixos-anywhere -- \
      --flake .#gallifrey \
      ${if sshPort == 22 then "" else "--ssh-port ${toString sshPort} \\\n      "}${targetHost}
  '';
}
