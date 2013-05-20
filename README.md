Lazy Registration Demo
======================

Lazy Registration Demo using:

* Ruby 2.0 (ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.0])
* Rails 4 (Rails 4.0.0.beta1)
* [Devise](https://wiki.github.com/plataformatec/devise) (3.0.0.rc 4e2cdc2)

## Information

I had a lot of trouble piecing together how to do lazy registration (gradual engagement) with Rails and Devise.  The blogs and advice that was out there did not include working examples and both the Rails and Devise API evolved over time, outdating much of the information that did exist.  This is a working demo built upon Rails 4, Ruby 2, and Devise 3.0.

Lazy Registration or Gradual Engagement aims to collect as little information at the start of the engagement as possible.  In this demo, we only ask for an email address before showing protected content (which is to be confirmed later).  This example doesn't cover guest account access, which provides even more gradual engagement than this demo.  An excellent example of using Guest User accounts can be found on [Railscast Episode #393](http://railscasts.com/episodes/393-guest-user-record) and this more closely follows [Sign up Forms Must Die] (http://alistapart.com/article/signupforms) presented by [Luke Wroblewski] (http://alistapart.com/author/lwroblewski).

This demo resides in "email_only" sub-folder because it is my intent to do a Guest User Lazy Registration as well in which a User instance is always available and thus Sign Up is delayed until as long as possible.  However, this demo came first because its what the client needed! 

Enjoy, and feel free to comment on anything in this project, or better yet, make it better by forking and improving!

### TODO

* Guest User demo
* Test cases

### References
* [Big Nerd Ranch - Lazy User Registration for Rails Apps](http://blog.bignerdranch.com/1679-lazy-user-registration-for-rails-apps/)
* [Devise How-to - Override confirmations so users can pick their own passwords as part of confirmation activation](https://github.com/plataformatec/devise/wiki/How-To:-Override-confirmations-so-users-can-pick-their-own-passwords-as-part-of-confirmation-activation)
* [Beta Blog - Kill Your Signup Form with Rails](http://blog.henriquez.net/2009/08/kill-your-signup-form-with-rails.html) 

### Contributing

If you'd like to improve this demo, simply fork, implement, and submit a pull request.

### Contributors

* You could be the first contributor!

### Maintainers

* Michael Lang (http://codeconnoisseur.org)

## License

This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/)
![Creative Commons](http://i.creativecommons.org/l/by/3.0/88x31.png)

