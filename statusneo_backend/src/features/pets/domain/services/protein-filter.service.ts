export class ProteinFilterService {
  private readonly allProteins = ['chicken', 'lamb', 'turkey', 'salmon', 'venison'];

  getAllowedProteins(allergies: string[]): string[] {
    const normalizedAllergies = allergies.map((a) => a.toLowerCase());

    return this.allProteins.filter(
      (protein) => !normalizedAllergies.includes(protein.toLowerCase())
    );
  }
}