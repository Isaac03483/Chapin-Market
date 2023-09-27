import { TestBed } from '@angular/core/testing';

import { ClientCardService } from './client-card.service';

describe('ClientCardService', () => {
  let service: ClientCardService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ClientCardService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
