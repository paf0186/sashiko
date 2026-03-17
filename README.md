# Sashiko-Gerrit Review Bridge

Automated AI code review for Lustre patches on Gerrit, powered by [Sashiko](https://github.com/sashiko-dev/sashiko).

## Setup

1. Create `.env` with your Anthropic API key:
   ```
   ANTHROPIC_API_KEY=sk-ant-...
   ```

2. Ensure Lustre is cloned:
   ```bash
   git clone git://git.whamcloud.com/fs/lustre-release.git ~/lustre-release
   ```

3. Build and start Sashiko:
   ```bash
   ./run.sh
   ```

4. Submit a Gerrit change for review:
   ```bash
   gc sashiko-review 64591           # review and post comments
   gc sashiko-review 64591 --dry-run # preview without posting
   gc sr 64591 --vote                # review with Code-Review vote
   ```

## Configuration

Edit `Settings.toml` to adjust:
- `[git] repository_path` - path to Lustre checkout
- `[ai] model` - Claude model to use
- `[review] concurrency` - parallel reviews (keep low for budget)
