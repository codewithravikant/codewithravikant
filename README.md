# Hi there! I'm Ravikant.

Welcome to my GitHub profile! I'm a full-stack developer in Helsinki focusing on **DevOps** after completing generative AI work at kood/Sisu.

## About Me

* **Student** at **[kood/Sisu](https://koodsisu.fi/)** — 24-month software programme (graduating January 2027)
* **Generative AI completed** (FitNexus) — now **continuing with DevOps**
* Building with TypeScript, JavaScript, Go, Python, and Bash
* Completed **Piscine Helsinki** — intensive C bootcamp
* Hands-on with Minikube, Helm, multi-VM labs, Ansible, Jenkins CI/CD, Docker, and Linux hardening
* Next: GitOps (ArgoCD) and Terraform

## Stats

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=codewithravikant&show_icons=true&theme=radical)

![GitHub Streak](https://streak-stats.demolab.com/?user=codewithravikant&theme=radical)![Top Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=codewithravikant&layout=compact&theme=radical)

## Achievements

Achievement: Pull Shark

## Technical Skills

* **Programming Languages:** TypeScript, JavaScript, Go, Python, C, Bash, SQL
* **Frontend:** React, Next.js, HTML/CSS, Tailwind CSS
* **Backend & Data:** Node.js, Express, REST APIs, Socket.IO, PostgreSQL, Prisma, MongoDB
* **DevOps:** Linux/Unix, Docker, Kubernetes, Minikube, Helm, Vagrant, Ansible, Jenkins, CI/CD, GitHub Actions, Nginx, Make, SSH/UFW, Trivy, Prometheus, Grafana, EFK
* **Continuing — DevOps:** ArgoCD, Terraform, GitOps
* **AI (completed track):** Prompt design, function calling, RAG, pgvector
* **Operating Systems:** Linux, Ubuntu, macOS

## Projects

Some of my repositories are private due to school policy — happy to share them on request!

*CV:* [Ravikant-CV](https://github.com/codewithravikant/Ravikant-CV)

### **kubernetesCluster** | Kubernetes Cluster Chronicles

A containerized diagnostic app on a local **Minikube** cluster: Deployments, Services, Ingress, PV/PVC, HPA, in-cluster Jenkins CI/CD, Prometheus/Grafana, and EFK logging.

**Key Features:**

- **Four namespaces:** `app` (backend + frontend + Ingress + HPA), `monitoring` (kube-prometheus-stack), `logging` (Elasticsearch, Fluent Bit, Kibana), `cicd` (Jenkins + local registry)
- **Traffic path:** browser → Ingress (`chronicles.local`) → frontend (2 replicas) → backend Service
- **Observability:** Prometheus ServiceMonitors, ingress-nginx and blackbox probes, Grafana, Alertmanager, Fluent Bit → Elasticsearch → Kibana
- **In-cluster CI/CD:** Jenkins, Kaniko builds, Trivy gate on CRITICAL findings, `kubectl` rollout and rollback
- **Operator dashboard:** cluster overview plus an Observe page for Grafana, Prometheus, Kibana, and Jenkins
- **App:** React + Vite frontend and Express diagnostics API with custom metric `chronicles_diagnostic_polls_total`

**Technical Implementation:**

- **Cluster:** Minikube (4 vCPU / 10 GB / 40 GB disk), kubectl, Helm; `make chronicles` installs missing CLIs
- **Workloads:** Deployments, Services, Ingress, HPA (frontend min 2, CPU 60%), PV/PVC
- **CI/CD:** in-cluster Jenkins, Kaniko, Trivy, local registry, Jenkinsfile and rollback pipeline
- **Monitoring:** kube-prometheus-stack, Alertmanager, EFK
- **Ops:** Make targets for bring-up, status, app-verify, dashboard, and rollback

**Learning Objectives:**

- Kubernetes workloads, networking (Services, Ingress, NetworkPolicy), and storage
- In-cluster Jenkins with image scan, deploy, and rollback
- Metrics, logs, and alerts on a local Minikube profile
- One-click cluster bring-up and operator-dashboard verification

**Repository:** [kubernetesCluster](https://github.com/codewithravikant/kubernetesCluster)

### **devops-monitoring** | Multi-VM Monitoring & Observability Lab 

Diagnostic app on a hardened **seven-VM** Ubuntu lab: containerized frontend/backend behind nginx, backup host, **Ansible + Jenkins CI/CD** on `cicd`, and **Prometheus / Grafana / ELK** on a dedicated `monitor` VM.

**Key Features:**

- **Seven-VM topology:** load balancer, web1/web2, appserver, backup, cicd (Jenkins + local Docker registry), and monitor
- **Observability stack:** Prometheus scrapes, Grafana dashboards/alerts, Filebeat → Logstash → Elasticsearch → Kibana
- **Idempotent Ansible:** SSH hardening, UFW, Docker, nginx load balancing, deploy, rollback, and monitoring agents
- **Jenkins CI/CD:** lint, audit, Trivy scans, deploy, rollback, optional Slack alerts
- **Load balancing:** weighted round-robin, least-conn, and resource-based algorithms
- **App:** React + Express diagnostics UI with live metrics and Prometheus `/metrics/prom`

**Technical Implementation:**

- **Infra:** Vagrant, VirtualBox, Make, Ansible, Bash provisioning
- **CI/CD:** Jenkins, local registry, Jenkinsfile deploy + rollback pipelines
- **Monitoring:** Prometheus, Grafana, Elasticsearch, Logstash, Kibana; optional Netdata stretch
- **Runtime:** Docker containers, nginx reverse proxy / LB
- **Security:** SSH key-only, UFW deny-by-default, lab-CIDR-only management UIs

**Learning Objectives:**

- Full-stack observability (metrics + logs) on a private multi-host lab
- Ansible roles for monitoring stack and agents alongside app deploy
- Jenkins pipelines with scan → deploy → rollback
- Backup/restore and load-balancing operations under monitoring

**Repository:** [devops-monitoring](https://github.com/codewithravikant/devops-monitoring)

### **Automation-VMs** | Multi-VM DevOps Lab

Diagnostic app on a hardened six-VM Ubuntu lab: containerized frontend/backend behind nginx, dedicated backup host, plus **Ansible + Jenkins CI/CD** on a `cicd` VM.

**Key Features:**

- **Six-VM topology:** load balancer, web1/web2, appserver, backup, and cicd (Jenkins + local Docker registry)
- **Idempotent Ansible:** SSH hardening, UFW, Docker, nginx load balancing, automated backups/restore
- **Jenkins CI/CD:** lint, audit, Trivy scans, deploy, rollback, optional Slack alerts
- **Load balancing:** weighted round-robin, least-conn, and resource-based algorithms
- **App:** React + Express diagnostics UI with live metrics behind the LB

**Technical Implementation:**

- **Infra:** Vagrant, VirtualBox, Make, Ansible, Bash provisioning
- **CI/CD:** Jenkins, local registry, Jenkinsfile deploy + rollback pipelines
- **Runtime:** Docker containers, nginx reverse proxy / LB
- **Security:** SSH key-only, UFW deny-by-default, review tests; optional Fail2Ban / WireGuard / Netdata

**Learning Objectives:**

- Multi-host Linux lab automation and hardening
- Ansible idempotency and role-based provisioning
- Jenkins pipelines with scan → deploy → rollback
- Backup/restore and load-balancing operations

**Repository:** [Automation-vms](https://github.com/codewithravikant/Automation-vms)

### **FitNexus (Chat Assistant)** | AI Wellness Full-Stack Application

A production-grade wellness platform that turns user profiles, habits, and daily signals into personalized health plans — powered by an AI coach with validated function calling and vector-based recipe retrieval.

**Key Features:**

- **AI Wellness Assistant:** Multi-turn conversational coach at `/assistant` — BMI, nutrition intake, meal plans, recipes, and progress charts via 6 scoped data tools
- **Daily Top 3 Plan:** AI-generated movement, nutrition, and mindfulness actions with persistent completion tracking
- **Multi-goal Onboarding:** Personalized strategy from 1–3 wellness goals with preserve mode for burnout recovery
- **Nutrition & RAG:** 500+ recipe/ingredient catalog with pgvector semantic search, allergy-aware filtering, and community reviews
- **Observation Layer:** Encrypted check-in summaries (food, water, sleep, stress) — AI uses aggregates, not raw sensitive events
- **Authentication & Security:** Email/password, GitHub/Google OAuth, TOTP 2FA, field encryption, and JSON data export

**Technical Implementation:**

- **Frontend:** Next.js 16, React 19, TypeScript 5, Tailwind CSS 4, Framer Motion, Three.js (3D wellness orb)
- **Backend:** Next.js API routes, Auth.js / NextAuth 5, Prisma 7 with PostgreSQL 16 (pgvector)
- **AI Integration:** OpenRouter API with task-level model routing, prompt verification, and conversation summarization
- **Testing & DevOps:** 207 unit tests (node:test), Playwright E2E, GitHub Actions CI, Docker multi-stage builds

**Learning Objectives:**

- Generative AI integration with function calling and hallucination guardrails
- RAG pipeline design with vector embeddings and semantic retrieval
- Full-stack auth (OAuth, 2FA, encrypted fields) and privacy-by-design data flows
- Production testing tiers (unit, integration, E2E) and containerized deployment

**Repository:** [chat-assistant](https://github.com/codewithravikant/chat-assistant)

### **Beachside Racetrack Real-time System** | Node.js Full-Stack Application

A sophisticated real-time racetrack information system that manages races and informs spectators with multiple interfaces for different user personas.

**Key Features:**

- **Real-time Communication:** All interfaces update instantly using Socket.IO
- **Multiple User Interfaces:** Dedicated screens for Receptionist, Safety Official, Lap-line Observer, Spectators, and Race Drivers
- **Race Management:** Configure sessions, add/edit/remove drivers, prepare/start/finish/end races, change flag modes
- **Lap Tracking:** Record lap times for individual cars with real-time leaderboards
- **Access Control:** Employee interfaces require specific access keys for security
- **Local Persistence:** Application state persists locally using LowDB, resuming from last state on restart

**Technical Implementation:**

- **Backend:** Node.js, Express.js, Socket.IO for real-time communication
- **Frontend:** HTML, CSS, Vanilla JavaScript with responsive design
- **Database:** LowDB for local file-based JSON storage
- **Tunneling:** Ngrok integration for internet access
- **Architecture:** Event-driven, real-time system with state management

**Learning Objectives:**

- Real-time web applications with Socket.IO
- Multi-interface system design
- State management and persistence
- Event-driven architecture
- User authentication and access control

**Repository:** [RunforSpeed](https://github.com/codewithravikant/racetrack)

### **Locked Alphabet** | Interactive JavaScript Game

A fun and interactive JavaScript game where you can create characters and "jail" them in a designated zone.

**Key Features:**

- **Interactive Gameplay:** Create characters with letter keys, control with mouse
- **Real-time Movement:** Characters follow your cursor with smooth animations
- **Game Mechanics:** Jail zone trapping, visual feedback, reset functionality
- **Responsive Design:** Works on different screen sizes with modern CSS

**Technical Implementation:**

- **Vanilla JavaScript:** No frameworks, pure ES6+ code
- **Event Handling:** Keyboard and mouse events for user interaction
- **DOM Manipulation:** Dynamic creation and modification of elements
- **Collision Detection:** Zone-based boundary checking
- **CSS Animations:** Smooth transitions and responsive layout

**Learning Objectives:**

- Event-driven programming
- Real-time user interaction
- DOM manipulation techniques
- CSS positioning and styling
- Game development concepts

**Repository:** [locked-alphabet](https://github.com/codewithravikant/locked-alphabet)

## Core Skills

* **Problem Solving:** Analytical thinking and systematic approach to challenges
* **Learning Agility:** Quick adaptation to new technologies and frameworks
* **Collaboration:** Team-oriented development with clear communication
* **Code Quality:** Clean, maintainable code with proper documentation
* **Testing & Debugging:** Systematic approach to finding and fixing issues
* **DevOps focus:** After generative AI completion, continuing with infrastructure, CI/CD, and cloud-native tooling
* **kood/Sisu student** — graduating January 2027

## Let's Connect!

* **LinkedIn:** [Ravikant Pandit](https://www.linkedin.com/in/ravikant-pandit/)
* **Email:** [codewithravikant@gmail.com](mailto:codewithravikant@gmail.com)
* **GitHub:** [@codewithravikant](https://github.com/codewithravikant)
* **CV:** [Ravikant-CV](https://github.com/codewithravikant/Ravikant-CV)

---

*Thanks for visiting my profile! Feel free to explore my projects and reach out if you'd like to collaborate or have any questions.*
