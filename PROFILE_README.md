# 🎯 Auto-Updating GitHub Profile

This repository contains my auto-updating GitHub profile that showcases my projects, skills, and activity. The profile automatically updates daily with fresh statistics and recent activity.

## 🚀 Features

### Auto-Updating Elements
- **Daily Statistics:** GitHub stats, streak, and activity graphs
- **Recent Activity:** Latest repository updates and contributions
- **Profile Views:** Visitor counter and engagement metrics
- **Last Updated:** Timestamp showing when the profile was last refreshed

### Dynamic Content
- **GitHub Stats:** Real-time statistics from GitHub API
- **Activity Graph:** Visual representation of coding activity
- **Top Languages:** Most used programming languages
- **GitHub Trophies:** Achievement badges and milestones

## 📁 Repository Structure

```
codewithravikant/
├── README.md                 # Main profile README (auto-updated)
├── .github/workflows/        # GitHub Actions automation
│   └── update-profile.yml    # Daily update workflow
├── scripts/                  # Python automation scripts
│   └── update_profile.py     # Profile updater script
├── requirements.txt          # Python dependencies
├── setup.sh                 # Setup script
├── PROJECTS.md              # Detailed project documentation
└── PROFILE_README.md        # This file
```

## 🔧 How It Works

### 1. GitHub Actions Workflow
- **Schedule:** Runs daily at 00:00 UTC
- **Manual Trigger:** Can be triggered manually from Actions tab
- **Automation:** Updates README.md with fresh data

### 2. Python Update Script
- **Data Fetching:** Retrieves statistics from GitHub API
- **Content Generation:** Updates README with current information
- **Error Handling:** Graceful handling of API rate limits

### 3. Dynamic Badges
- **Shields.io:** Real-time badges for stats and status
- **GitHub Stats:** Vercel-powered statistics cards
- **Activity Graph:** Visual coding activity representation

## 🛠️ Setup Instructions

### Prerequisites
- Python 3.7+
- Git repository named exactly like your username
- GitHub account with Actions enabled

### Quick Setup
```bash
# Clone or create your profile repository
git clone https://github.com/codewithravikant/codewithravikant.git
cd codewithravikant

# Run the setup script
./setup.sh

# Push to GitHub
git add .
git commit -m "🎯 Initial profile setup"
git push origin main
```

### Manual Setup
1. **Create Repository:** Create a repository named exactly like your GitHub username
2. **Copy Files:** Copy all files from this repository
3. **Install Dependencies:** `pip install -r requirements.txt`
4. **Test Script:** `python scripts/update_profile.py`
5. **Push to GitHub:** Commit and push all files
6. **Enable Actions:** Go to Settings > Actions > General and enable workflows

## 📊 What Gets Updated

### Daily Updates
- [x] Last updated timestamp
- [x] GitHub statistics (followers, repositories, etc.)
- [x] Recent repository activity
- [x] Profile view counter

### Real-time Elements
- [x] GitHub stats cards
- [x] Activity graph
- [x] Top languages chart
- [x] GitHub trophies
- [x] Profile views

## 🎨 Customization

### Personal Information
Edit `README.md` to update:
- Your name and bio
- Tech stack and skills
- Project descriptions
- Contact information

### Styling
- **Theme:** Change `theme=radical` to other themes
- **Colors:** Modify badge colors and styles
- **Layout:** Adjust section order and content

### Automation
- **Schedule:** Modify cron schedule in `.github/workflows/update-profile.yml`
- **Data Sources:** Add new data sources in `scripts/update_profile.py`
- **Content:** Customize what gets updated in the script

## 🔍 Troubleshooting

### Common Issues

**GitHub Actions not running:**
- Check if Actions are enabled in repository settings
- Verify the workflow file is in `.github/workflows/`
- Check the Actions tab for error messages

**Script errors:**
- Ensure Python 3.7+ is installed
- Install dependencies: `pip install -r requirements.txt`
- Check GitHub API rate limits

**Profile not updating:**
- Verify repository is named exactly like your username
- Check if README.md is in the root directory
- Ensure the repository is public

### Debugging
```bash
# Test the update script locally
python scripts/update_profile.py

# Check GitHub Actions logs
# Go to Actions tab in your repository

# Verify API access
curl https://api.github.com/users/codewithravikant
```

## 📈 Performance

### API Rate Limits
- GitHub API: 60 requests/hour for unauthenticated requests
- Shields.io: No rate limits for public badges
- Vercel: No rate limits for stats cards

### Optimization
- Script runs only once per day
- Caches data to minimize API calls
- Graceful error handling for rate limits

## 🤝 Contributing

Feel free to fork this repository and customize it for your own profile! 

### Customization Tips
1. **Update Personal Info:** Modify README.md with your details
2. **Add Projects:** Include your own projects and repositories
3. **Change Theme:** Experiment with different color schemes
4. **Add Features:** Extend the Python script with new data sources

## 📝 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- **GitHub Stats:** [anuraghazra/github-readme-stats](https://github.com/anuraghazra/github-readme-stats)
- **Activity Graph:** [Ashutosh00710/github-readme-activity-graph](https://github.com/Ashutosh00710/github-readme-activity-graph)
- **GitHub Trophies:** [ryo-ma/github-profile-trophy](https://github.com/ryo-ma/github-profile-trophy)
- **Profile Views:** [antonkomarev/github-profile-views-counter](https://github.com/antonkomarev/github-profile-views-counter)

---

*This profile automatically updates daily to showcase the latest projects and activity.*
