# DLT5141 Assignment  
## Building a Decentralized To-Do List Application

---

## Overview

Your task is to build a Decentralized To-Do List Application, starting from a basic Web1 interface and culminating in a fully decentralized Web3 DApp. This project will expose you to the evolution of internet application design: static content (Web1), dynamic interaction (Web2), and decentralized ownership and logic (Web3).

---

## Assessment Criteria

| Criterion                                   | Marks |
|---------------------------------------------|-------|
| Web1: Static To-Do list                    | 5%    |
| Web2: Interactivity & Persistence          | 15%   |
| Web3: Smart Contract Design & Deployment   | 25%   |
| Web3: Frontend & Smart Contract Integration| 25%   |
| UI/UX Design & Usability                   | 10%   |
| GitHub Usage, Code Architecture & Quality  | 10%   |
| Documentation & Overall Understanding      | 10%   |

---

## Use Of AI Tools

- AI coding assistants (e.g., ChatGPT) may be used, but:
  - Example prompt usage:
    - *Acceptable*: What is a `struct` in the context of Ethereum smart contracts?
    - *Prohibited*: Copy-pasting sections of the assignment outline.
- You must include links to any AI chat history used during development.
- You are expected to fully understand all code included in your submission and may be asked to explain specific parts.
- Submissions that rely entirely on AI without comprehension will not be accepted.

---

## Submission

- **Due date:** 23:59 Friday 27/06/2025
- **Submissions:** via GitHub Classroom
- **Office hours:** available upon request

---

## Development Setup Instructions

After accepting your assignment via GitHub Classroom, follow these steps to get your project running. This guide helps you use GitHub Desktop to manage your repository without Git terminal commands:

1. **Clone your assignment repository using GitHub Desktop:**
   - If you don’t already have one, create a GitHub account at [https://github.com/](https://github.com/).
   - Download and install GitHub Desktop from [https://desktop.github.com/](https://desktop.github.com/).
   - Open GitHub Desktop and sign in with your GitHub account.
   - Click `File > Clone Repository`.
   - In the `GitHub.com` tab, find your assignment repository (linked to your Classroom account).
   - Select the repository, choose a local folder to save the project, and click `Clone`.

2. **Open the project folder in your code editor:**  
   Use the `Show in Finder` (Mac) or `Show in Explorer` (Windows) button in GitHub Desktop to open the project folder. Open this folder in your preferred code editor (Visual Studio Code is recommended).

3. **Install recommended VS Code extensions (optional but advised):**
   - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
   - [HTML CSS Support](https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css)
   - [ESLint Javascript](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
   - [Solidity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

4. **Check if Node.js and npm are installed:**  
   Open your terminal and run:
   ```
   node -v
   npm -v
   ```
   If these commands display version numbers, you’re ready to proceed. If not, install Node.js (which includes npm) from [https://nodejs.org/](https://nodejs.org/). After installation, restart your terminal and verify again.

5. **Install dependencies:**  
   Open a terminal inside the project folder. In VS Code, select Terminal/New Terminal, or use your system terminal and navigate to the project folder. Then run:
   ```
   npm install
   ```

6. **Start the development server:**  
   After dependencies are installed, start the app locally by running:
   ```
   npm run dev
   ```
   This should open your app automatically in a browser window at [http://localhost:5173](http://localhost:5173). If not, open this URL manually.

---

## Web1: Static HTML To-Do List

Develop a basic To-Do list with the following characteristics:

- Tasks are manually written using semantic HTML elements (e.g. `<h1>`, `<ul>`, `<li>`).
- Apply clean, visually appealing styling using CSS.
- The page is static and should not include any interactive JavaScript.

**Deliverable:**  
Submit a static application with at least 5 manually-written to-do items in HTML, styled using CSS.

---

## Web2: Dynamic To-Do List

Convert your static To-Do list into an interactive web application using JavaScript. It should:

- Allow users to add new tasks using an input field and a button with HTML.
- Let users mark tasks as complete with event listeners.
- Use classes (completed/pending) to control CSS styling.
- Display tasks dynamically without reloading the page.

**Deliverable:**  
Submit a complete Web2 To-Do List application using HTML, CSS, and JavaScript.

---

## Web3: Decentralized To-Do List

Transform your application into a decentralized application (DApp) by deploying a smart contract on Ethereum. The goal is to manage a shared to-do list on-chain, where multiple Ethereum users can complete public tasks and have their wallet addresses recorded as having done so.

### Smart Contract Requirements

Develop a contract named `ToDoList.sol` that includes the following:

- Define a `Task` struct with these fields:
  - `id` (uint): A unique task identifier
  - `description` (string): The task description
  - `completedBy` (address[]): A dynamic list of wallet addresses that have completed the task

- Store all tasks in a `Task[]` array, making them accessible globally.

- Implement these functions:
  - `addTask(string memory description)`: Allows any user to add a new task with a unique ID.
  - `getTasks()`: Returns the full list of tasks.
  - `completeTask(uint id)`: Marks the task with the given id as completed by `msg.sender`, appending their address to `completedBy`.
  - `getCompletedBy(uint id)`: Returns the list of addresses that have completed the specified task.

This contract design facilitates collaborative task management, allowing multiple users to add and complete tasks while tracking participation transparently on-chain.

---

### Deploying Your Smart Contract with Remix and MetaMask

To deploy your contract, follow these steps:

1. Open [https://remix.ethereum.org/](https://remix.ethereum.org/) in your web browser.
2. Create a new file named `ToDoList.sol` and paste your Solidity code into it.
3. Go to the **Solidity Compiler** tab, select the compiler version matching your contract’s pragma, and click `Compile ToDoList.sol`.
4. Switch to the **Deploy & Run Transactions** tab.
5. Set the `Environment` dropdown to `Injected Web3` to connect Remix to MetaMask.
6. Unlock MetaMask and select the network where you want to deploy (e.g., Sepolia testnet).
7. In Remix, under `Contract`, select `ToDoList` and click `Deploy`.
8. Confirm the deployment transaction in MetaMask and wait for it to be mined.
9. After deployment, copy the contract address from Remix’s `Deployed Contracts` section for use in your frontend application.

---

### Frontend Integration Requirements

Your frontend should connect to Ethereum and interact with your deployed contract as follows:

- **MetaMask Connection:**
  - Detect MetaMask via `window.ethereum`.
  - Prompt users to connect their wallet and retrieve their current address.
  - Display the connected wallet address prominently in the UI.

- **Smart Contract Interactions using Ethers.js:**
  - `addTask`: Allow users to add a new task by calling the contract’s `addTask` function with a task description, sending a blockchain transaction.
  - `getTasks`: Fetch all tasks from the contract and render them in your app.
  - `completeTask`: Enable users to mark tasks as completed by invoking `completeTask` with the task ID from their connected wallet.
  - `getCompletedBy`: For each task, retrieve the list of wallet addresses that completed it, and indicate in the UI if the connected user has already completed that task.

- **User Experience Enhancements:**
  - Provide feedback during transactions (e.g., loading indicators, confirmations).
  - Handle errors gracefully, including user rejection of transactions or MetaMask not being installed.

---

## Final Deliverables

Submit the following via GitHub Classroom:

- Code repository containing:
  - Reproducible source code with commits throughout development.
  - Deployed smart contract address.
  - `README.md` with instructions for others to reproduce.

Any questions, reach out.