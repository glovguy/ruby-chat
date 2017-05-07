import { Injectable } from '@angular/core';
import { BaseRequestOptions, ConnectionBackend, Http, RequestOptions } from '@angular/http';

import 'rxjs/add/operator/map';

@Injectable()
export class MessageService {

  constructor(private http: Http) { }

  getMessages(successCallback, failureCallback): void {
      this.http.get(`/chat/messages`)
      .map(resp => resp.json())
      .subscribe(
          (data) => successCallback(data),
          (error) => failureCallback(error)
          );
  }

  createMessage(value, successCallback, failureCallback) {
    var myj = {
      data: {
        attributes: {
          body: value
        }
      }
    }
    this.http.post(`/chat/messages`, {
      data: {
        attributes: {
          body: value
        }
      }
    })
    .map(resp => resp.json())
    .subscribe(
        (data) => successCallback(data),
        (error) => failureCallback(error)
        );
  }
}
