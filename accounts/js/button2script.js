// Get the current date
var currentDate = new Date();

// Format the date as YYYY-MM-DD
var year = currentDate.getFullYear();
var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
var day = ('0' + currentDate.getDate()).slice(-2);
var formattedDate = year + '-' + month + '-' + day;

// Set the default value of the date input field to the current date
document.getElementById('selected_date').value = formattedDate;

function updateIdSField() {
    var receivedFrom = document.getElementById('receivedFrom').value;

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var id_s = response.id_s;

                document.getElementById('id_s').value = id_s;
            } else {
                console.error('Error: ' + xhr.status);
            }
        }
    };
    xhr.open('GET', 'get_id_s.php?receivedFrom=' + receivedFrom, true);
    xhr.send();
}

function updateReceivedInfo() {
    var receivedFrom = document.getElementById('receivedFrom').value;
    var collegeSelect = document.getElementById('college');
    var selectedOptionText = collegeSelect.options[collegeSelect.selectedIndex].text;
    var level = document.getElementById('level').value;
    var totalPaidAmountArabic = document.getElementById('totalPaidAmountArabic').value;
    var studyYear = document.getElementById('studyYear').value;
    var paymentfor = document.getElementById('paymentfor').value;

    var receivedInfo = "تسديد " + paymentfor + " كلية  " + selectedOptionText + " المرحلة " + level + " للعام الدراسي " + studyYear;

    // Set the value of receivedInfo textarea
    document.getElementById('receivedInfo').value = receivedInfo;
    // Set the value of receivedInfo hidden input field
    document.getElementById('receivedInfoHidden').value = receivedInfo;
}

// Call the function when form inputs change
document.getElementById('receivedFrom').addEventListener('change', updateReceivedInfo);
document.getElementById('college').addEventListener('change', updateReceivedInfo);
document.getElementById('level').addEventListener('change', updateReceivedInfo);
document.getElementById('totalPaidAmountArabic').addEventListener('input', updateReceivedInfo);
document.getElementById('studyYear').addEventListener('change', updateReceivedInfo);
document.getElementById('paymentfor').addEventListener('change', updateReceivedInfo);
document.getElementById('receivedFrom').addEventListener('input', updateIdSField);

// Autocomplete feature for the "Received From" field
document.getElementById('receivedFrom').addEventListener('input', function() {
    var input = this.value;
    var nameSuggestions = document.getElementById('nameSuggestions');
    nameSuggestions.innerHTML = '';

    // Fetch names from PHP and display suggestions
    fetch('get_names.php?input=' + input)
        .then(response => response.json())
        .then(data => {
            data.forEach(function(name) {
                var suggestion = document.createElement('div');
                suggestion.className = 'name-suggestion';
                suggestion.innerHTML = name;
                suggestion.addEventListener('click', function() {
                    document.getElementById('receivedFrom').value = name;
                    nameSuggestions.innerHTML = '';
                    updateIdSField(); // Update the associated id_s field
                });
                nameSuggestions.appendChild(suggestion);
            });
        })
        .catch(error => console.error('Error fetching names:', error));
});

// Update the associated id_s field
function updateIdSField() {
    var receivedFrom = document.getElementById('receivedFrom').value;

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var id_s = response.id_s;

                document.getElementById('id_s').value = id_s;
            } else {
                console.error('Error: ' + xhr.status);
            }
        }
    };
    xhr.open('GET', 'get_id_s.php?receivedFrom=' + receivedFrom, true);
    xhr.send();
}
