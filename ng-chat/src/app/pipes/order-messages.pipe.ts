import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'orderMessages',
  pure: false
})
export class OrderMessagesPipe implements PipeTransform {

  transform(jsn) {
    if (jsn==null) {
      return null;
    } else {
      var copy = jsn.slice();
      copy = copy.sort(this.messageSort);
      return copy.reverse();
    }
  }

  messageSort(a,b) {
    return a['id'] > b['id']
  }

}
