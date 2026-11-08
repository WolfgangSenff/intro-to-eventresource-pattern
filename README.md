# Intro to the EventResource pattern in Godot

Everyone knows the EventBus pattern is a hack. Or at least everyone should know that. The EventResource pattern is the proper way to handle the EventBus pattern in an extremely clean way, and, when combined with components, becomes the most powerful pattern for game development in Godot.

This is not just hype. Once you fully understand how things are wired together, this can speed up your development massively, while still providing a much cleaner codebase in general than the EventBus pattern typically does.

# The history

I come from a long line of architect astronauts who have overdone just about everything, from game architectures to full business app architectures and more. I (accidentally) helped make an application for one of the top four largest airline conglomerates in the world at the time that was so complex and so abstract that it never really fully did anything, and most of the people on the team didn't understand that 11 billion interface, abstract, and virtual functions with and without generics are actually kinda a terrible solution to problems - really they just create more problems.

I say this so that when I tell you I understand terrible architecture, you know I'm not joking. I've seen it all.

And I used to program in Unity.

In Unity, there's a very clever kind of object known as the ScriptableObject. A ScriptableObject, simply described, is a component that has no visuals and doesn't even try to draw anything - it runs in the game loop still, but because it doesn't render anything, it can handle a lot more logic and calculations and things without destroying the physics of a game, for instance. As such, people offload a lot of the heavier calculations to them: AI, some physics computations, things of those nature. They also do it because they support inheritance, which is possibly just a side benefit of being made with C#, but never-the-less it's still pretty nice to have.

Godot has the same thing. If you've ever seen my channel - which this pattern introduction video is kind of a "reboot" for - then you know I love Resources in Godot. That's because they are essentially ScriptableObjects on crack. Indeed, while ScriptableObjects are pretty nice to have in Unity, they are powerless compared to Resources in Godot.

But Unity has made something nice - the exception that proves the rule - with their ScriptableObjects in the form of what they call Event Channels. An Event Channel is a ScriptableObject that contains and event that can be listened to or emit from anywhere, thus turning it into a little object that contains an event.

And I thought to myself: why can't we use the same thing in Godot, only with the much more powerful Resources? That's the entire basis for what I'm calling the EventResource pattern, and this repo is the code for the videos of the same name. You can find the videos at https://www.youtube.com/@BackAt50Ft.
