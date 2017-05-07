/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';
import { Http } from '@angular/http';

import { MessageRiverComponent } from './message-river.component';
import { MessageService } from '../../services/message.service';
import { OrderMessagesPipe } from '../../pipes/order-messages.pipe';

describe('MessageRiverComponent', () => {
  let component: MessageRiverComponent;
  let fixture: ComponentFixture<MessageRiverComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MessageRiverComponent, OrderMessagesPipe ],
      providers: [ Http, MessageService ],
    })
    .compileComponents();

    this.messageService = MessageService;
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MessageRiverComponent);
    component = fixture.componentInstance;
    const messageServiceMock = function (successCallback, failureCallback): void {
      return successCallback({ data: 'some message' });
    }
    spyOn(MessageService, 'getMessages').and.callFake(messageServiceMock);
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
