## **Part 1 Architecture Principles**

### Part A – Frontend Architecture (Flutter)

1. High-Level Architecture Overview

The system follows a Server-Driven UI (SDUI) pattern, acting as a rendering engine that interprets JSON configurations to orchestrate the user journey.

The architecture is strictly separated into:

Configuration Layer: Parsing and validation of DTOs.

State Layer: Management of user answers and template variables.

Navigation Layer: Logic for conditional routing and "unsupported step" skipping.

UI Layer: A library of agnostic widgets.

2. Component Renderer Pattern (“Alchemist”)

To achieve a UI-agnostic system, we use a Registry Pattern. A central dispatcher receives a componentType and returns the corresponding widget. This allows adding new step types without modifying the core navigation logic.

Logic Example (Pseudo-code):
Widget buildStep(Step step) {

final widgetRegistry = {

'list': (data) => QuestionListWidget(data),

'input': (data) => QuestionInputWidget(data),

'englishJourney': (data) => TransitionWidget(data),

};

final builder = widgetRegistry[step.componentType];

return builder != null ? builder(step) : UnsupportedStepPlaceholder(step);

}
3. Navigation & Conditional Logic

Navigation is not linear; it is predicate-based. The engine evaluates the nextSteps array by checking if the user's current answers satisfy the defined conditions.

Condition Evaluation Logic:
bool matches(Condition cond, Map answers) {

final userAnswer = answers[cond.stepId];

return userAnswer.contains(cond.optionId);

}

String resolveNextStep(Step current, Map answers) {

for (var path in current.nextSteps) {

if (path.conditions.every((c) => matches(c, answers))) {

return path.nextStepId;

}

}

return defaultNextStep;

}
Back Navigation: Managed via a History Stack (LIFO) to ensure the user returns to the exact previous step, regardless of the dynamic path taken.

4. Template Resolution

All strings pass through a resolver that replaces placeholders (e.g., {{name}}) with stored values before the UI layer renders them.

### Part B – Frontend ↔ Backend Communication

1. Completion Payload

Upon finishing the onboarding, the client sends a "Snapshot" of the experience. This includes identifiers to ensure the backend processes the data against the correct version of the configuration.

Payload Structure:
{

"flowId": "onboarding_v2",

"configVersion": "1.0.4",

"responses": { "step_1": "option_a", "step_name": "Ezequiel" },

"metadata": { "platform": "ios", "appVersion": "2.1.0" }

}
```jsx

```

2. Personalization Pipeline State Machine

The communication during the asynchronous personalization process is managed via a reactive state machine. The frontend monitors the jobId returned by the backend.

State Modeling:
abstract class PersonalizationState {}

class InProgress extends PersonalizationState {

final double progress;

final String stage;

}

class Completed extends PersonalizationState {

final String redirectUrl;

}

class Failed extends PersonalizationState {

final String error;

final bool retryable;

}
3. Communication Strategy

Polling/WebSockets: The frontend queries GET /status/{jobId}.

Processing States: The UI displays specific feedback for each stage (e.g., "Analyzing your level...", "Finalizing environment...").

Error Recovery: If the pipeline fails, the system uses the retryable flag to decide whether to show a "Retry" button or escalate to support.