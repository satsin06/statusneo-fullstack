import { describe, it, expect } from 'vitest';
import { ProteinFilterService } from '../domain/services/protein-filter.service';

describe('ProteinFilterService', () => {
  const service = new ProteinFilterService();

  it('should exclude allergic proteins from recommendations', () => {
    const allergies = ['chicken', 'salmon'];

    const allowedProteins = service.getAllowedProteins(allergies);

    expect(allowedProteins).not.toContain('chicken');
    expect(allowedProteins).not.toContain('salmon');

    expect(allowedProteins).toContain('lamb');
    expect(allowedProteins).toContain('turkey');
    expect(allowedProteins).toContain('venison');
  });
});