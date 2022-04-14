# mousejump
Simple xcode project to handle jumping my mouse between screen when they don't line up

[Here is my comment](https://news.ycombinator.com/item?id=31019245) from Hacker News where I described this:


> I use it because I have 2 monitors in vertical orientation, one in horizontal between them, and another smaller monitor above the center monitor. Here is some ascii art of it:


                     +----------------+
                     |                |
    +------------+   |                |   +------------+
    |          ! |   | !             !|   | !          |
    |          ! |   | !             !|   | !          |
    |          ! |   +----------------+   |            |
    |            | +-+----------------+-+ |            |
    |            | |                    | |            |
    |            | |                    | |            |
    |            | |                    | |            |
    |            | |                    | |            |
    |            | |                    | |            |
    |            | +--------------------+ |            |
    |          ! |                        | !          |
    |          ! |                        | !          |
    |          ! |                        | !          |
    +------------+                        +------------+

    ! = Where my mouse would get stuck

> My little app helps to keep my cursor from getting "caught" on the 2 vertical monitors. By default macOS treats the parts of my vertical monitors that go above/below the middle monitor as hard stops/walls so it's annoying if my mouse is too low/high that I have to stop what I'm doing, drag my cursor up/down, then continue moving across the monitors. Likewise, the only way to get to the top monitor is to first go to the center monitor then go up. I hated feeling like my mouse was running into walls constantly so I wrote this app. If my cursor hits any of the old "walls" then my app moves the cursor up/down until it lines up with the bottom/top edge of the center monitor. Also if I'm hitting a wall at the top of the vertical monitors it will jump me over the "gap" to the to top-center monitor.
> I looked for (and paid for) a couple of apps out there that claim to do this or something similar but none of them worked for me. I had never really written any Swift code but I was able to cobble together enough code to make it work and in around 200 lines of code I got exactly what I wanted. I wrote this over 2 years ago and I haven't had to touch it since. In fact the first time I rebooted I got confused at why my mouse was getting stuck because I had grown so used to it (added my little "app" to login items and everything has been smooth sailing ever since).

> EDIT: Added "!" to the diagram to show all the places my mouse would get "stuck" previously. I left out the ones on the center monitor since they are harder to explain where I'd get stuck going up (the edges since the bottom monitor is higher resolution that the top one).
