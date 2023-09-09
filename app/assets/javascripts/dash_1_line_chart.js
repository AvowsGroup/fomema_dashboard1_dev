// Define the chart configuration
var chartConfig = {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [
            {
                label: 'Year 2019',
                backgroundColor: 'red',
                borderColor: 'red',
                fill: false,
                data: [],
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        title: {
            display: false,
            text: 'Chart.js Line Chart - Logarithmic',
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: false,
                    labelString: 'Date',
                },
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: false,
                    labelString: 'Index Returns',
                },
                ticks: {
                    min: 0,
                    max: 1000,
                    stepSize: 100,
                },
            }],
        },
    },
};

// Function to create the chart
function createChart() {
    var ctx = document.getElementById('canvas').getContext('2d');
    window.myLine = new Chart(ctx, chartConfig);
}

// Delegated event handler for the "Randomize Data" button
document.getElementById('content-container').addEventListener('click', function(event) {
    if (event.target && event.target.id === 'randomizeData') {
        chartConfig.data.datasets.forEach(function(dataset) {
            dataset.data = dataset.data.map(function() {
                return randomScalingFactor();
            });
        });
        window.myLine.update();
    }
});

// Function to load AJAX content and initialize the chart
function loadContent() {
    // Make your AJAX request to load content here...
    // After content is loaded, insert it into the #content-container
    // Then call createChart() to initialize the chart
}

// Function to generate random data
function randomScalingFactor() {
    return Math.round(Math.random() * 1000);
}

// Call loadContent to load AJAX content and initialize the chart
loadContent();
