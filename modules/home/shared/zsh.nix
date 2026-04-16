{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      bindkey "^H" backward-word
      bindkey "^J" down-line-or-history
      bindkey "^K" up-line-or-history
      bindkey "^L" forward-word

      cowsay() {
        command cowsay "$@" | sed $'s/^/\x1b[32m/; s/$/\x1b[0m/'
      }
    '';

    shellAliases = {
      v = "nvim";
      sv = "sudo nvim";
      c = "clear";
      cat = "bat";
      ls = "eza --icons --group-directories-first -1";
      ll = "eza --icons -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";
    };
  };
}
