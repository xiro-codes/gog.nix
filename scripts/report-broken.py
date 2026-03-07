import os
import subprocess
import json

def get_game_metadata(game_name):
    """
    Evaluates the meta attribute of a game and returns it as a dictionary.
    """
    # Specifically evaluate the .meta attribute to check for the broken flag
    cmd = [
        "nix", "eval",
        f".#packages.x86_64-linux.{game_name}.meta",
        "--json"
    ]

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        return json.loads(result.stdout)
    except subprocess.CalledProcessError:
        # Return a dummy dict if evaluation fails entirely (e.g. syntax error)
        return {"broken": "EVAL_ERROR"}

def main():
    games_dir = "pkgs/games"
    if not os.path.exists(games_dir):
        print(f"Error: {games_dir} directory not found.")
        return

    # List games based on the directories in pkgs/games
    games = [d for d in os.listdir(games_dir)
             if os.path.isdir(os.path.join(games_dir, d))]

    print("--- GOG.NIX Meta.Broken Report ---")
    print(f"Scanning {len(games)} games for 'meta.broken = true'...\n")

    broken_list = []
    eval_errors = []

    for game in sorted(games):
        meta = get_game_metadata(game)

        if meta.get("broken") == "EVAL_ERROR":
            print(f"⚠️  {game: <30} | EVALUATION FAILED")
            eval_errors.append(game)
        elif meta.get("broken") is True:
            print(f"❌ {game: <30} | MARKED BROKEN")
            broken_list.append(game)
        else:
            print(f"✅ {game: <30} | OK")

    print("\n--- Summary ---")
    print(f"Total Games:    {len(games)}")
    print(f"Marked Broken:  {len(broken_list)}")
    print(f"Eval Failures:  {len(eval_errors)}")

    if broken_list:
        print("\nGames to fix (meta.broken = true):")
        for g in broken_list:
            print(f" - {g}")

if __name__ == "__main__":
    main()
