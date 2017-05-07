import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-collaboration',
  templateUrl: './collaboration.component.html',
  styleUrls: ['./collaboration.component.css']
})
export class CollaborationComponent implements OnInit {

  constructor() { }

  raw_text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. <mark>Cras</mark> venenatis laoreet tempor. Integer facilisis ultrices justo, vel pellentesque purus rhoncus eget. Nulla eget faucibus ante, eu blandit dui. Integer tincidunt blandit aliquam. Curabitur posuere ultricies turpis. Quisque molestie nunc at scelerisque placerat. Mauris rutrum, augue non tincidunt bibendum, massa arcu consectetur leo, nec consequat elit elit vel arcu. Aenean purus libero, tincidunt fermentum massa a, ornare feugiat mi. In hac habitasse platea dictumst. Sed urna neque, gravida a enim sit amet, pharetra maximus sem. Vivamus cursus a neque sit amet rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque eleifend leo et risus molestie efficitur sit amet eu diam. In lacinia, diam eget tristique mattis, urna metus commodo enim, eu sodales lorem ante vitae risus. Sed non tempus tortor, at pharetra est.';

  ngOnInit() {
  }

  replace(txt: string, search: string) {
    let searchRgx = new RegExp('('+search+')', 'gi');

    return txt.replace(searchRgx, `<mark>$1</mark>`);
  }

  addRegex(search: string) {
    this.collaboration_text = this.replace(this.collaboration_text, search);
  }

  search = 'eget';
  collaboration_text = this.replace(this.raw_text, this.search)

}
