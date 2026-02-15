Part 1 Architecture Principles
Format
Written responses - No code implementation required.
The Scenario
Frontend: Dynamic Onboarding Module (Flutter)
You are given a task to build a dynamic Onboarding module in a Flutter application, where the entire flow of screens, logic, order, navigation, content, and assets is determined by a JSON coming from a server.
The JSON includes a list of Steps. Each Step has a stepType / componentType, collections of options, assets, texts, and routing logic (nextSteps) that includes conditions based on selections from other Steps.
In addition, the data includes templates (like {{name}}), assets for preloading, and logic for skipping unsupported Steps. You can find the complete DTO file on the ZIP file that was attached.
The onboarding system must be UI-agnostic, flexible, and resilient to changes in the configuration without requiring code modifications.
The system needs to be built emphasizing separation between: Widgets (UI), State / controllers, Configuration parsing, Navigation logic
Backend: Personalization Pipeline (Context Only)
The backend is responsible for processing onboarding answers and preparing the user’s personalized learning environment. It validates and stores user preferences and runs a long multi-stage personalization process.
This backend does not serve onboarding configuration and is out of scope for implementation in this exercise.
You should consider the backend only as an external system that:
Receives the final onboarding answers
Starts an asynchronous personalization process
Exposes status or progress information that the frontend can query
The goal
The goal of this assignment is to evaluate how you design a configuration-driven frontend architecture in Flutter, with strong separation of concerns and clear ownership of logic. It has to be structured to ensure maintainability.
You are not expected to design or implement the backend. The backend exists only to provide context for frontend-backend communication.
What your submission should cover (Guidelines)
Part A – Frontend Architecture (Flutter)
Describe how you would design a dynamic, JSON-driven onboarding experience in Flutter.
Explain how responsibilities are separated across UI, state, navigation, and configuration.
Describe how routing, conditional navigation, and dynamic rendering work.
Explain how user progress, back navigation, and unsupported steps are handled.
How template variables and dynamic content are resolved over time (check DTO)
Part B – Frontend ↔ Backend Communication (High Level)
What information the frontend sends to the backend when onboarding is completed.
What identifiers or metadata are included (e.g. configuration version, flow ID).
What information the frontend expects from the backend while the personalization pipeline is running.
How the frontend models and displays processing states (loading, in progress, completed, failed).
How this communication can be represented using simple pseudo-code or interface definitions.
Out of Scope
Backend data models and database schemas
Implementation details of the personalization pipeline
Infrastructure, queues, or worker design
Detailed backend error-handling strategies
Deliverable
Submit a single document (PDF, Notion, Google Doc or the preferred format) clearly describing your solution. Use diagrams or pseudo-code where helpful. Your submission will be discussed in a follow-up technical defense interview.
Part 2 - Frontend development
Attached is a video recording of a screen in our application.
The goal is to receive a screen that works one-to-one like the one shown in the video, including all micro-interaction details.
I need you to design and develop a screen in Flutter including all the features, animations, behaviors, transitions, and interactions that the screen performs. This screen has to match the figma design (view and components styles properties) and video (animations), matching them as much as possible, using approximated values when not found in the Figma document (e.g. colors, border sizes, etc).
Requirements:
Full UI recreation
All layout, colors, spacing, icons, fonts, and elements as defined in Figma.
Full UX recreation
Animations, transitions, state changes, focus, menu opening, presses, drags, etc.
Language configuration
The texts should be translated to the user device’s language.
All functionality
Every button/component must behave as shown in the video.
Based on the first step response the contents, description and title for the following screen should be adapted. 
Links:
Video: https://drive.google.com/file/d/1BKvK9TGsXeU4mBBQZ8Zp6PwqX_gyCIkx/view?usp=sharing 
Figma: https://www.figma.com/design/2muj2uABBMCzYTqpr22VpO/Onboarding-Assignment?node-id=0-1&p=f&t=nCKAjMVuwkXBtl5U-0
Notes:
The DTO that should be used for this is the “Truncated” DTO that is included in the ZIP file.