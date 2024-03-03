var stripePublicKey = $('#id_stripe_pubic_key').text().slice(1, -1);
var clientSecret = $('#id_client_secret').text().slice(1, -1);

var stripe = Stripe(stripePublicKey);
var elements = stripe.elements();

var style = {
    base: {
        color: '#000',
        fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
        fontSmoothing: 'antialiased',
        fontSize: '16px',
        '::placeholder': {
            color: '#aab7c4'
        }
    },
    invalid: {
        color: '#dc3545',
        iconColor: '#dc3545'
    }
};

var card = elements.create('card', {style: style});
card.mount('#card-element');

// Handle realtime validation errors on the card element

card.addEventListener('change', function (event){
    var errorDiv = document.getElementById('card-errors');
    if (event.error) {
        var html = `
            <span class="icon" role="alert">
                <i class="fa fa-times"></i>
            </span>
            <span>${event.error.message}</span>
        `;
        $(errorDiv).html(html);
    } else {
        errorDiv.textContent = '';
    }
});

// Handle form submission

var form = document.getElementById('payment-form');

form.addEventListener('submit', function(ev) {
    ev.preventDefault();
    card.update({ 'disabled':true});
    $('#submit_button').attr('disabled', true);
    $('#payment-form').fadeToggle(100);
    $('#loading-overlay').fadeToggle(100);
    stripe.confirmCardPayment(clientSecret, {
        payment_method: {
            card: card,
        }
    }).then(function(result) {
        if (result.error) {
            var errorDiv = document.getElementById('card-errors');
            var html = `
            <span class="icon" role="alert">
                <i class="fa fa-times"></i>
            </span>
            <span>${result.error.message}</span>
        `;
        $(errorDiv).html(html);
        console.log("a")
        $('#payment-form').fadeToggle(100);
        console.log("b")
        $('#loading-overlay').fadeToggle(100);
        console.log("c")
        card.update({ 'disabled': false});
        $('#submit_button').attr('disabled', false);
        } else {
            if (result.paymentIntent.status === 'succeeded') {
                form.submit()
            }
        }
    });
});