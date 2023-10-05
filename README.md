# Heartland Exercise -- Brian "Burrito" Bommarito

## Initial thoughts

This was a fun little challenge. It's one I have not seen before, which is refreshing, and while it's not hard, it is tricky. I enjoyed working on it and I hope you find my code up to snuff.

I would like to thank everyone there for giving me this opportunity. I look forward to the outcome no matter what it may be.

## Notes on coding style

1. I use keyword arguments almost exclusively.
2. I do NOT use the new hash syntax. I find it looks like malformed code and can become very confusing, especially with a long set of params OR if the variables are higher up in the code.
3. I work on a happy path/sad path style of coding. I make sure that the known good state works, and then I set about to break it, or think of how someone could break it.
4. I do not test private methods. I know some feel it's okay to do, and that's fine, but for me, personally, it's not. I can, however, adapt to whatever style the team I am on prefers.
5. I use yarddoc almost exclusively. I have used RBS in the past, but never got along well with it. It feels a bit like Typescript/Java/C#s style of static typing and it feels strange alongside a Ruby project. But, again, I can follow along with what the team prefers.

## Notes on this challenge

1. While I use a class (which wasn't originally my plan) for a Photo, I do the validation tests within the photo_renamer tests. This makes sense as we want to make sure that the photo_renamer handles errors gracefully.
2. If there is an error in one of the strings, I silently ignore it. Normally I would offer feedback (something like `[unprocessable lines:] <lines>`) but for brevity, and to match the requested output, I opted to not do that. An even better approach here would be to pull in `ActiveModel` and use its errors in the output. I didn't feel the need to pull in... what... a fifth of Rails? for this exercise.
3. The use of negation in the `valid?` function is a bit of a habit from Vandegrift. I can certainly avoid using negation, but again, that is based on the team I am on and their preference. As you may notice, I'm flexible.

I would like to thank you all again, and I look forward to what comes next.
