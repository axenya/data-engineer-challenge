# Description: The 'project_name_code' column is derived from the 'project_name' column. This correction involves:
normalized_df['project_name_code'] = normalized_df['project_name']
    .str
    .split(' - ')
    .str[0]
    .astype('string')

# Description: The 'document' column undergoes multiple transformations to standardize its format.
normalized_df['document'] = normalized_df['document']
    .astype('string')
    .str
    .replace('.', '')
    .str
    .replace('-', '')
    .str
    .zfill(11)
