#pms


```php

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smooth Long Press with SVG</title>
    <style>
        body {
            user-select: none; /* Disable text selection on the entire page */
        }
        #teeth-container {
            margin: 20px;
        }
        .tooth {
            fill: #ffffff;
            stroke: #000;
            stroke-width: 2;
            cursor: pointer;
        }
        .decayed { fill: #795C34; }
        .missing { fill: #FF0000; }
        .treated { fill: #00FF00; }
        .viable { fill: #008000; }
        .none { fill: #ffffff; }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px;
            background-color: #fff;
            border: 2px solid #000;
            padding: 20px;
            z-index: 1000;
        }
        .modal.active {
            display: block;
        }
        .modal-header {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .option {
            margin: 5px 0;
            cursor: pointer;
            padding: 10px;
            border: 1px solid #000;
        }
        .surface { border: 2px solid blue; }
        .deep { border: 2px solid orange; }
        .grossly { border: 2px solid red; }
    </style>
</head>
<body>
    <h1>Smooth Long Press on SVG Tooth</h1>

    <div id="teeth-container">
        <!-- SVG tooth elements -->
        <svg width="300" height="100">
            <rect class="tooth" x="20" y="20" width="60" height="60" data-tooth="1" />
            <rect class="tooth" x="100" y="20" width="60" height="60" data-tooth="2" />
            <rect class="tooth" x="180" y="20" width="60" height="60" data-tooth="3" />
        </svg>
    </div>

    <!-- Modal for long press options -->
    <div id="optionsModal" class="modal">
        <div class="modal-header">Select Option for Decayed Tooth</div>
        <div class="option" data-option="surface">Surface Decay</div>
        <div class="option" data-option="deep">Deep Decay</div>
        <div class="option" data-option="grossly">Grossly Decayed</div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const states = ['none', 'decayed', 'missing', 'treated', 'viable'];
            let currentIndex = {};
            let longPressTimer;
            let currentTooth = null;
            let longPressDuration = 500; // Set long press duration to 500ms

            // Prevent text selection on long press (for mobile and touch devices)
            window.addEventListener('touchmove', (e) => {
                e.preventDefault();
            }, { passive: false });

            // Initialize tooth states
            document.querySelectorAll('.tooth').forEach((tooth, index) => {
                currentIndex[index + 1] = 0; // Each tooth starts with 'none' state
                tooth.classList.add(states[0]); // Apply the 'none' state
            });

            // Function to update the state of a tooth
            const updateState = (tooth, toothNumber, state) => {
                // Remove all states from the tooth and apply the new state
                tooth.classList.remove(...states);
                tooth.classList.add(state);
            };

            // Click to cycle through states
            document.querySelectorAll('.tooth').forEach(tooth => {
                tooth.addEventListener('click', () => {
                    const toothNumber = tooth.dataset.tooth;
                    currentIndex[toothNumber] = (currentIndex[toothNumber] + 1) % states.length;
                    updateState(tooth, toothNumber, states[currentIndex[toothNumber]]);
                });
            });

            // Handle long press detection
            const onLongPressStart = (event) => {
                const tooth = event.target;
                const toothNumber = tooth.dataset.tooth;
                currentTooth = tooth;

                // Start the timer for long press
                longPressTimer = setTimeout(() => {
                    if (tooth.classList.contains('decayed')) {
                        document.getElementById('optionsModal').classList.add('active');
                    }
                }, longPressDuration);
            };

            const onLongPressEnd = () => {
                clearTimeout(longPressTimer); // Cancel long press if released early
            };

            // Add long press events
            document.querySelectorAll('.tooth').forEach(tooth => {
                // Handle mouse events
                tooth.addEventListener('mousedown', onLongPressStart);
                tooth.addEventListener('mouseup', onLongPressEnd);
                tooth.addEventListener('mouseleave', onLongPressEnd);

                // Handle touch events
                tooth.addEventListener('touchstart', onLongPressStart);
                tooth.addEventListener('touchend', onLongPressEnd);
                tooth.addEventListener('touchcancel', onLongPressEnd);
            });

            // Handle option selection from the modal
            document.querySelectorAll('.option').forEach(option => {
                option.addEventListener('click', (event) => {
                    const selectedOption = event.target.dataset.option;

                    if (selectedOption === 'surface') {
                        currentTooth.classList.add('surface');
                    } else if (selectedOption === 'deep') {
                        currentTooth.classList.add('deep');
                    } else if (selectedOption === 'grossly') {
                        currentTooth.classList.add('grossly');
                    }

                    // Hide the modal after selection
                    document.getElementById('optionsModal').classList.remove('active');
                });
            });
        });
    </script>
</body>
</html>


```
