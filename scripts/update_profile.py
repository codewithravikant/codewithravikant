#!/usr/bin/env python3
"""
GitHub Profile Updater (DEACTIVATED)

This script previously auto-updated the profile README with GitHub stats.
It is no longer used — update README.md manually instead.
"""

import sys

# Set to True to re-enable the legacy auto-updater.
ENABLED = False


class GitHubProfileUpdater:
    def __init__(self, username):
        self.username = username
        self.github_api = f"https://api.github.com/users/{username}"

    def get_github_stats(self):
        """Fetch basic GitHub statistics"""
        import requests

        try:
            response = requests.get(self.github_api)
            if response.status_code == 200:
                data = response.json()
                return {
                    'public_repos': data.get('public_repos', 0),
                    'followers': data.get('followers', 0),
                    'following': data.get('following', 0),
                    'created_at': data.get('created_at', ''),
                    'updated_at': data.get('updated_at', '')
                }
        except Exception as e:
            print(f"Error fetching GitHub stats: {e}")
        return {}

    def get_recent_activity(self):
        """Get recent repository activity"""
        import requests

        try:
            response = requests.get(f"{self.github_api}/repos?sort=updated&per_page=5")
            if response.status_code == 200:
                repos = response.json()
                return [{
                    'name': repo['name'],
                    'description': repo.get('description', ''),
                    'language': repo.get('language', ''),
                    'stars': repo.get('stargazers_count', 0),
                    'forks': repo.get('forks_count', 0),
                    'updated_at': repo.get('updated_at', '')
                } for repo in repos]
        except Exception as e:
            print(f"Error fetching recent activity: {e}")
        return []

    def update_readme(self):
        """Update the README.md file with current data"""
        import re
        from datetime import datetime

        try:
            with open('README.md', 'r', encoding='utf-8') as f:
                content = f.read()

            stats = self.get_github_stats()
            recent_repos = self.get_recent_activity()
            current_date = datetime.now().strftime('%Y--%m--%d')

            content = re.sub(
                r'Last_Updated-.*?-blue',
                f'Last_Updated-{current_date}-blue',
                content
            )

            if '## 🔥 Recent Activity' not in content:
                activity_section = self.generate_activity_section(recent_repos)
                content = content.replace(
                    '## 🤝 Connect With Me',
                    f'{activity_section}\n\n## 🤝 Connect With Me'
                )
            else:
                activity_section = self.generate_activity_section(recent_repos)
                content = re.sub(
                    r'## 🔥 Recent Activity.*?## 🤝 Connect With Me',
                    f'{activity_section}\n\n## 🤝 Connect With Me',
                    content,
                    flags=re.DOTALL
                )

            with open('README.md', 'w', encoding='utf-8') as f:
                f.write(content)

            print(f"✅ Profile updated successfully on {current_date}")

        except Exception as e:
            print(f"Error updating README: {e}")

    def generate_activity_section(self, repos):
        """Generate the recent activity section"""
        if not repos:
            return "## 🔥 Recent Activity\n\n*No recent activity to display*"

        section = "## 🔥 Recent Activity\n\n"
        section += "| Repository | Description | Language | Stars | Forks |\n"
        section += "|------------|-------------|----------|-------|-------|\n"

        for repo in repos[:5]:
            name = repo['name']
            desc = repo['description'][:50] + "..." if repo['description'] and len(repo['description']) > 50 else repo['description'] or "No description"
            lang = repo['language'] or "N/A"
            stars = repo['stars']
            forks = repo['forks']

            section += f"| [{name}](https://github.com/{self.username}/{name}) | {desc} | {lang} | {stars} | {forks} |\n"

        return section


def main():
    """Main function to update the profile"""
    if not ENABLED:
        print("scripts/update_profile.py is deactivated. Update README.md manually.")
        sys.exit(0)

    username = "codewithravikant"
    updater = GitHubProfileUpdater(username)
    updater.update_readme()


if __name__ == "__main__":
    main()
