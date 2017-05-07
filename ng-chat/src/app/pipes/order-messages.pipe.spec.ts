/* tslint:disable:no-unused-variable */
import { TestBed, async, inject } from '@angular/core/testing';
import { OrderMessagesPipe } from './order-messages.pipe';
import { Http } from '@angular/http';

@NgModule({
    imports: [HttpModule]
})

describe('The chat receives message history from the server', () => {
  let messagesJson = [
      {
          "id": 1,
          "body": "first message that is very long because I need to test how the styles interact, because what if I have to change the css? I suspect this will be long enough, but who can really tell anymore?",
          "sender": 1,
          "style": "bot"
      },
      {
          "id": 2,
          "body": "second message!",
          "sender": 1,
          "style": "user"
      },
      {
          "id": 3,
          "body": "third message from sender 2...",
          "sender": 2,
          "style": "user"
      }
  ];
  let sortedMessagesJson = [
      {
          "id": 3,
          "body": "third message from sender 2...",
          "sender": 2,
          "style": "user"
      },
      {
          "id": 2,
          "body": "second message!",
          "sender": 1,
          "style": "user"
      },
      {
          "id": 1,
          "body": "first message that is very long because I need to test how the styles interact, because what if I have to change the css? I suspect this will be long enough, but who can really tell anymore?",
          "sender": 1,
          "style": "bot"
      }
  ];
  let pipe;

  beforeEach(() => {
    pipe = new OrderMessagesPipe;
  });

  it('orders the incoming messages', () => {
    const msgOut = pipe.transform(messagesJson);

    expect(msgOut).toEqual(sortedMessagesJson);
  });
});
