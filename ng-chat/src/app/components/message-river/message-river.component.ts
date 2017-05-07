import { Component, OnInit } from '@angular/core';
import { Ng2Cable, Broadcaster } from 'ng2-cable/js/index';

import { MessageService } from '../../services/message.service';

@Component({
  selector: 'app-message-river',
  templateUrl: './message-river.component.html',
  styleUrls: ['./message-river.component.scss'],
  providers: [ MessageService, Ng2Cable, Broadcaster ]
})
export class MessageRiverComponent implements OnInit {

  messages: Object;

  constructor(private MessageService: MessageService,
              private ng2cable: Ng2Cable,
              private broadcaster: Broadcaster) { }

  ngOnInit() {
    this.getMessages();
    this.ng2cable.subscribe('http://localhost:3000/cable', 'ChatChannel');

    this.broadcaster.on<string>('newMessage').subscribe(
      msg => {
        var msgID = msg['id']-1;
        this.messages[msgID] = msg;
      }
    );
  }

  getMessages(): void {
    this.MessageService.getMessages(this.messagesLoaded, this.messageLoadFailure);
  }

  messagesLoaded = (data) => {
    this.messages = data;
  }

  messageLoadFailure = (error) => {
    return error;
  }

}
