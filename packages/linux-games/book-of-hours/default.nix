{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "book-of-hours";
  version = "0.1.0";
  paths = [
    { file = "book_of_hours/book_of_hours_2025_8_e_6_86506.sh"; sha256 = "sha256-NJnxaP5F4f5wcMb7cQLK+Tia5O6INHhDxplzvti+Gj8="; }
  ];
  # testing this again bad dl 
  meta.broken = false;
}
  inputs

