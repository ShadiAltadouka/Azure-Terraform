async function loadTasks() {
    const response = await fetch('http://4.154.227.82/tasks');
    const tasks = await response.json();
    const taskList = document.getElementById('task-list');
    taskList.innerHTML = tasks.map(task => `<li>${task.title}: ${task.description}</li>`).join('');
}
window.onload = loadTasks;
