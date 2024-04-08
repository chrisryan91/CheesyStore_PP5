document.addEventListener('DOMContentLoaded', function () {
    // Select all elements with the class 'confirmButton'
    var confirmButtons = document.querySelectorAll('.confirmButton');
    // Iterate over the NodeList and attach an event listener to each button
    confirmButtons.forEach(function(button) {
        button.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent the form from submitting immediately
            var userResponse = confirm('Are you sure you want to delete this comment?');
            if (userResponse) {
                // If the user confirms, submit the form programmatically
                this.form.submit();
            }
            // If the user does not confirm, do nothing (the form will not be submitted)
        });
    });
});