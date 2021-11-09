Rails.configuration.stripe = {
     :publishable_key => 'pk_test_51HGvg5JfukXgeBIwzjjFvwYuq97I5yt8AKD8nrwBS3BAYjSqfnOTaazmJrOh9DMS53Rds9ElZlbgJJ270pMzcZHu00h9BPL9Zr',
     :secret_key      => 'sk_test_51HGvg5JfukXgeBIwwcPnAJY8hWveZ65Y8zhcFTnWYmG2EmqC9lGse6KxQ48Bjlvtf3Q7CIHL0n8gbKeBfNCPPivU00ie4OEE2j'
    }
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
