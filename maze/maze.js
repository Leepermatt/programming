const mazeWidth = 10;
const mazeHeight = 10;
const mazeContainer = document.getElementById('maze_container');
let maze = [];

// Maze cell types
const WALL = 0;
const PATH = 1;

// Initialize the maze grid
function createMazeGrid() {
    let table = '<table>';
    for (let row = 0; row < mazeHeight; row++) {
        table += '<tr>';
        for (let col = 0; col < mazeWidth; col++) {
            table += `<td id="cell_${row}_${col}" class="wall"></td>`;
        }
        table += '</tr>';
    }
    table += '</table>';
    mazeContainer.innerHTML = table;
}

// Initialize maze data with all walls
function initializeMaze() {
    createMazeGrid();
    maze = []; // Reset the maze array

    // Set all cells as walls
    for (let row = 0; row < mazeHeight; row++) {
        maze[row] = [];
        for (let col = 0; col < mazeWidth; col++) {
            maze[row][col] = WALL; // All cells start as walls
        }
    }

    // generate maze
    generateMaze(0, 0);

    // Set the finish point (end goal)
    setEndGoal();

    // Ensure the start cell (0, 0) is a valid path
    maze[0][0] = PATH; // Make the start position a path
    document.getElementById(`cell_0_0`).classList.remove('wall');
    document.getElementById(`cell_0_0`).classList.add('path');

    // Initialize the player at the top-left corner (0,0)
    setupPlayer();
}

// Directions: up, down, left, right
const directions = [
    { r: -1, c: 0 }, // Up
    { r: 1, c: 0 },  // Down
    { r: 0, c: -1 }, // Left
    { r: 0, c: 1 }   // Right
];

// Maze generation using recursive backtracking
function generateMaze(row, col) {
    maze[row][col] = PATH; // Mark current cell as path
    document.getElementById(`cell_${row}_${col}`).classList.remove('wall');
    document.getElementById(`cell_${row}_${col}`).classList.add('path');

    // Shuffle directions to randomize the path generation
    const randomDirections = shuffle(directions);

    // Explore each direction
    for (let { r, c } of randomDirections) {
        const newRow = row + r * 2; // Move two steps to create a gap
        const newCol = col + c * 2;

        if (newRow >= 0 && newRow < mazeHeight && newCol >= 0 && newCol < mazeWidth) {
            if (maze[newRow][newCol] === WALL) {
                maze[newRow][newCol] = PATH; // Mark as path
                document.getElementById(`cell_${newRow}_${newCol}`).classList.remove('wall');
                document.getElementById(`cell_${newRow}_${newCol}`).classList.add('path');

                // Mark the cell between current and next cell as path to create an open path
                const midRow = row + r;
                const midCol = col + c;
                maze[midRow][midCol] = PATH;
                document.getElementById(`cell_${midRow}_${midCol}`).classList.remove('wall');
                document.getElementById(`cell_${midRow}_${midCol}`).classList.add('path');

                // Recursively generate the maze from the new cell
                generateMaze(newRow, newCol);
            }
        }
    }
}

// Shuffle an array for random movement directions
function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]]; // Swap elements
    }
    return arr;
}


// Set the end goal at a random path location
function setEndGoal() {
    let randomRow, randomCol;
    do {
        // Randomly pick a cell within maze boundaries
        randomRow = Math.floor(Math.random() * mazeHeight);
        randomCol = Math.floor(Math.random() * mazeWidth);
    } while (maze[randomRow][randomCol] !== PATH);  // Ensure the cell is a path

    const endCell = document.getElementById(`cell_${randomRow}_${randomCol}`);
    endCell.classList.remove('wall');
    endCell.classList.add('finish'); // Mark the end cell as green (finish)
    endCell.setAttribute("id", "endGoal");  // Set an ID to identify the end goal
}

// Initialize player at the start position (top-left corner)
let playerRow = 0;
let playerCol = 0;

function setupPlayer() {
    document.getElementById(`cell_${playerRow}_${playerCol}`).classList.add('player');
}

// Move player with arrow keys
document.addEventListener('keydown', function (e) {
    let newRow = playerRow;
    let newCol = playerCol;

    switch (e.key) {
        case 'ArrowUp':
            newRow--;
            break;
        case 'ArrowDown':
            newRow++;
            break;
        case 'ArrowLeft':
            newCol--;
            break;
        case 'ArrowRight':
            newCol++;
            break;
    }

    if (newRow >= 0 && newRow < mazeHeight && newCol >= 0 && newCol < mazeWidth) {
        const nextCell = document.getElementById(`cell_${newRow}_${newCol}`);
        // Player can move only through path cells or the end goal
        if (nextCell.classList.contains('path') || nextCell.id === "endGoal") {
            // Update the player's position
            document.getElementById(`cell_${playerRow}_${playerCol}`).classList.remove('player');
            nextCell.classList.add('player');

            playerRow = newRow;
            playerCol = newCol;

            // Check if the player has reached the end goal
            if (nextCell.id === "endGoal") {
                alert("Congratulations! You've reached the goal!");
            }
        }
    }
});

// Initialize the maze and the game
initializeMaze();
