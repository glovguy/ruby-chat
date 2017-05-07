import { Component, ViewChild, OnInit, Output, Input, EventEmitter } from '@angular/core';
import { Ng2Cable, Broadcaster } from 'ng2-cable/js/index';

import { CollaborationComponent } from '../collaboration/collaboration.component';
import { MessageService } from '../../services/message.service';

@Component({
  selector: 'app-client',
  templateUrl: './client.component.html',
  styleUrls: ['./client.component.css'],
  providers: [Ng2Cable, Broadcaster, MessageService]
})
export class ClientComponent implements OnInit {
  @Input('collabMod') collabMod: CollaborationComponent;
  field_value:string = '';

  constructor(collaboration: CollaborationComponent,
              private MessageService: MessageService,
              private ng2cable: Ng2Cable,
              private broadcaster: Broadcaster) {
  }

  ngOnInit() {
  }
  thisiswhatIgot = '';

  sendMessage(value: string) {
    this.collabMod.addRegex(value);
    this.MessageService.createMessage(value, this.messageSuccess, this.printOut);
  }

  printOut = (data) => {
    console.log(data.responseText);
  }

  messageSuccess = (data) => {
    this.field_value = null;
  }

}
