async function loadTasks() {
    const response = await fetch('http://4.154.227.82/tasks');
    const tasks = await response.json();
    const taskList = document.getElementById('task-list');
    const loadingMessage = document.getElementById('loading-message');
    const errorMessage = document.getElementById('error-message');
    
    // Clear the previous list and error messages
    taskList.innerHTML = '';
    errorMessage.style.display = 'none';
    loadingMessage.style.display = 'block';

    try {
        // Fetch tasks from the Flask backend (Replace with your actual external IP if running in Kubernetes)
        const response = await fetch('http://4.154.227.82/tasks'); 
        const tasks = await response.json();
        
        // Hide the loading message
        loadingMessage.style.display = 'none';

        // Populate the task list
        if (tasks.length === 0) {
            taskList.innerHTML = '<li>No tasks available.</li>';
        } else {
            tasks.forEach(task => {
                const listItem = document.createElement('li');
                listItem.innerHTML = `
                    <div class="task-title">${task.title}</div>
                    <div class="task-description">${task.description || 'No description provided'}</div>
                `;
                taskList.appendChild(listItem);
            });
        }
    } catch (error) {
        // Show error message if tasks could not be fetched
        loadingMessage.style.display = 'none';
        errorMessage.style.display = 'block';
    }
}

// Load tasks when the page is loaded
window.onload = loadTasks;

