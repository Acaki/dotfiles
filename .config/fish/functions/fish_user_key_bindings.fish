function fish_user_key_bindings
  fzf_key_bindings
  fish_vi_key_bindings
  bind \cA beginning-of-line
  bind \cE end-of-line
  bind --mode insert \cA beginning-of-line
  bind --mode insert \cE end-of-line
end
