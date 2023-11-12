# Skeleton
Skeleton Mesh created by Muhammad Mahdi and Andrew Minerva

1. Multi-arm IK. Two arms with 3 joints and an end effector each.  Both arms reach for the object and are connected by a central root that does not move and one shared root that allows for the skeleton to lean.
2. Joint limits, the shoulders and wrists of the skeleton possess joint limits that restrict the potential angle of movement.
3. User Interaction, the user can control the camera and objective in the 3D version while the 2D version allows for movement of the skeleton.
4. Moving IK, the Ik is able to move in the 2D version.
5. 3D Rendering and camera, camera is controled easily by the user in a well lit and clear 3D environment.

3D implementation of multi-arm IK with an easily used camera
https://youtu.be/lip0PlCTUwM

2D implementation of multi-arm IK with moving IK, user interaction, and joint limits.
https://www.youtube.com/watch?v=BNebw-32dy8

2D implementation without any joint limits in the arm.
https://youtu.be/g6dIjn-lCHo

We faced two major problems during the development of our IK, the first being the leaning function of the IK and the second being the move to 3D.

We solved the first problem by re-evaluating the way that the central root interacted with the multi-arm IK, by creating a second stable root that would keep the multi-arm IK still we could manipulate the location of the central root of the multi-arm IK, allowing the skeleton to lean.

The second problem came from the fact that 3D rectangles have their positions at the center rather than at one of the corners, we solved this problem by tinkering and playing with the locations and points we fed the multi-arm IK until the simulation looked coherent.
