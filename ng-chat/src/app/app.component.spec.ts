/* tslint:disable:no-unused-variable */

import { TestBed, async } from '@angular/core/testing';
import { HttpModule, Http, BaseRequestOptions, ConnectionBackend, RequestOptions } from '@angular/http';
import { MockBackend, MockConnection } from '@angular/http/testing';

import { AppComponent } from './app.component';
// import { AppComponent } from './app.component';
import { ClientComponent } from './components/client/client.component';
import { MessageRiverComponent } from './components/message-river/message-river.component';
import { CollaborationComponent } from './components/collaboration/collaboration.component';
import { OrderMessagesPipe } from './pipes/order-messages.pipe';

describe('AppComponent', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [
        AppComponent,
        ClientComponent,
        MessageRiverComponent,
        CollaborationComponent,
        OrderMessagesPipe,
      ],
      providers: [
      Http,
      HttpModule,
      MockBackend,
      ConnectionBackend,
      RequestOptions,
      ],
      // providers: {
      //     imports: Http,
      //     provide: Http,
      //     useFactory: (mockBackend, options) => {
      //       return new Http(mockBackend, options);
      //     },
      //     deps: [MockBackend, BaseRequestOptions]
      //   },
    });
    TestBed.compileComponents();
  });

  it('should create the app', async(() => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app).toBeTruthy();
  }));

  it(`should have as title 'app works!'`, async(() => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app.title).toEqual('app works!');
  }));

  it('should render title in a h1 tag', async(() => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    expect(compiled.querySelector('h1').textContent).toContain('app works!');
  }));
});
