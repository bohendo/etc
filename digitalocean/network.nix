{

  nixie = { modulesPath, lib, name, ... }: {
    imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
      (modulesPath + "/virtualisation/digital-ocean-config.nix")
    ];

    system.stateVersion = "22.05";

    deployment.targetHost = "0.0.0.0"; # TODO: replace with real IP
    deployment.targetUser = "root";

    networking.hostName = name;
    networking.firewall.allowedTCPPorts = [ 80 ];

    deployment.healthChecks = {
      http = [{
        scheme = "http";
        port = 80;
        path = "/";
        description = "check that nginx is running";
      }];
    };

    services.nginx = {
      enable = true;
      virtualHosts.default = {
        default = true;
        locations."/".return = "200 \"Hello from nixie :)\"";
      };
    };

  };

}
